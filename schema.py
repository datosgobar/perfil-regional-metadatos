#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Genera representaciones de la documentación del perfil de metadatos"""

from __future__ import print_function, unicode_literals, with_statement

import pandas as pd
from tabulate import tabulate

CATALOG_CSV_PATH = "schema/perfil-regional-metadatos-csv/catalog.csv"
DATASET_CSV_PATH = "schema/perfil-regional-metadatos-csv/dataset.csv"
DISTRIBUTION_CSV_PATH = "schema/perfil-regional-metadatos-csv/distribution.csv"
FIELD_CSV_PATH = "schema/perfil-regional-metadatos-csv/field.csv"
THEME_CSV_PATH = "schema/perfil-regional-metadatos-csv/theme.csv"
SCHEMA_PATH = "docs/schema.md"
SCHEMA_DER_PATH = "assets/schema.png"


def csv_to_html(csv_path):
    """Convierte un archivo CSV en una tabla HTML."""
    df = pd.read_csv(csv_path, encoding="utf8")
    return tabulate(df, tablefmt="html", headers="keys",
                    showindex=False)


def generate_markdown_schema(schema_path):
    template = """
Reference
===

<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Schema

{schema}

## Fields of the profile

### Catalogue (`catalog`)

{catalog}

### Dataset (`dataset`)

{dataset}

### Distribution (`distribution`)

{distribution}

### Field (`field`)

{field}

### Theme (`theme`)

{theme}
"""
    text = template.format(
        schema="![schema]({})".format(SCHEMA_DER_PATH),
        catalog=csv_to_html(CATALOG_CSV_PATH),
        dataset=csv_to_html(DATASET_CSV_PATH),
        distribution=csv_to_html(DISTRIBUTION_CSV_PATH),
        field=csv_to_html(FIELD_CSV_PATH),
        theme=csv_to_html(THEME_CSV_PATH)
    )

    with open(schema_path, "wb") as f:
        f.write(text.encode("utf8"))


if __name__ == '__main__':
    generate_markdown_schema(SCHEMA_PATH)
