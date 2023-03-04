[![ducker: [noun] a person or thing that ducks](ducker_definition.png)](https://www.dictionary.com/browse/ducker)

# 🦆 Ducker

Small docker image with [DuckDB](https://github.com/duckdb/duckdb) and [PRQL](https://github.com/PRQL/prql) included!

The extensions included and loaded are:
  * [prql](https://github.com/ywelsch/duckdb-prql)
  * [httpfs](https://duckdb.org/docs/extensions/httpfs.html)
  * [json](https://duckdb.org/docs/extensions/json)
  * [parquet](https://duckdb.org/docs/data/parquet)
  * [postgres_scanner](https://duckdb.org/docs/extensions/postgres_scanner)
  * [sqlite_scanner](https://duckdb.org/docs/extensions/sqlite_scanner)
  * [substrait](https://duckdb.org/docs/extensions/substrait)

## Quickstart

```bash
alias dckr='docker run --rm -it -v $(pwd):/data -w /data duckerlabs/ducker'
```
then `dckr` gives you a [DuckDB](https://duckdb.org/) shell with [PRQL](https://www.prql-lang.org/) enabled!

For example, to get the first 5 lines of a csv file named "albums.csv", you could run
```bash
dckr -c 'from `albums.csv` | take 5;'
```

## Acknowledgements

This repo is adapted from https://github.com/davidgasquez/docker-duckdb.
