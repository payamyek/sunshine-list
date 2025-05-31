from datetime import datetime
import pandas as pd
from sqlalchemy import create_engine
from typing import Dict


def _extract(url: str) -> pd.DataFrame:
    return pd.read_csv(url)


def _transform(df: pd.DataFrame) -> Dict[str, pd.DataFrame]:
    df["employer_id"] = df["Employer"].astype("category").cat.codes
    df["sector_id"] = df["Sector"].astype("category").cat.codes
    df["job_title_id"] = df["Job Title"].astype("category").cat.codes

    employee_df = df[
        [
            "First Name",
            "Last Name",
            "Salary",
            "Benefits",
            "employer_id",
            "sector_id",
            "job_title_id",
        ]
    ].rename(
        columns={
            "First Name": "first_name",
            "Last Name": "last_name",
            "Salary": "salary",
            "Benefits": "benefits",
        }
    )

    employer_df = (
        df[["employer_id", "Employer"]]
        .rename(columns={"employer_id": "id", "Employer": "name"})
        .drop_duplicates()
    )

    job_title_df = (
        df[["Job Title", "job_title_id"]]
        .rename(
            columns={
                "job_title_id": "id",
                "Job Title": "name",
            }
        )
        .drop_duplicates()
    )

    sector_df = (
        df[["Sector", "sector_id"]]
        .rename(
            columns={
                "sector_id": "id",
                "Sector": "name",
            }
        )
        .drop_duplicates()
    )

    result = {
        "employees": employee_df,
        "employers": employer_df,
        "job_titles": job_title_df,
        "sectors": sector_df,
    }

    # add timestamp columns to all tables
    for table_name, table_df in result.items():
        now = pd.to_datetime(datetime.now())
        table_df["created_at"] = now
        table_df["updated_at"] = now

    return result


def _load(db_con_string: str, table_to_df: Dict[str, pd.DataFrame]):
    engine = create_engine(db_con_string, echo=False)

    with engine.connect() as con:
        for table_name, df in table_to_df.items():
            df.to_sql(table_name, con, if_exists="append", index=False)


def etl(url: str, db_con_str: str):
    raw_df = _extract(url)
    table_to_df = _transform(raw_df)
    _load(db_con_str, table_to_df)


if __name__ == "__main__":
    db_con = "sqlite:////Users/payam/Developer/projects/sunshine-list/backend/storage/development.sqlite3"

    etl(
        "https://www.ontario.ca/public-sector-salary-disclosure/pssd-assets/files/2024/tbs-pssd-compendium-salary-disclosed-2024-en-utf-8-2025-03-26.csv",
        db_con,
    )
