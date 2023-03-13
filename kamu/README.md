# Kamu

A command-line tool for managing, transforming, and collaborating on ODF structured data.

## Quickstart

1. Initialize a new Kamu workspace: `kamu init`
2. Add the dataset manifest: `kamu add . --recursive`
3. Pull the dataset: `kamu pull --all`
4. Run a query: `kamu sql -c 'select * from "fivethirtyeight.data.alcohol-consumption" limit 10' --engine datafusion`
5. Finally, you can start a notebook with `kamu notebook` or explore the UI with `kamu ui`
