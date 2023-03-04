FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install DuckDB
# --------------

# Place this after apt-get so it doesn't bust the cache
ARG DUCKDB_VERSION

RUN wget https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VERSION}/duckdb_cli-linux-amd64.zip \
    && unzip duckdb_cli-linux-amd64.zip -d /usr/local/bin \
    && rm duckdb_cli-linux-amd64.zip

# Install PRQL
# ------------

ARG PRQL_VERSION

RUN duckdb -unsigned -c "SET custom_extension_repository='welsch.lu/duckdb/prql/$PRQL_VERSION'; INSTALL prql;"

# Install Extensions
# ------------------

ARG EXTENSIONS
ARG LOAD_EXTENSIONS
ENV LOAD_EXTENSIONS=$LOAD_EXTENSIONS

RUN for e in $EXTENSIONS; do echo "Installing $e ..."; duckdb -c "INSTALL $e;"; done

#ENTRYPOINT /usr/local/bin/duckdb -unsigned -cmd "LOAD prql; $LOAD_EXTENSIONS"
ENTRYPOINT ["/usr/local/bin/duckdb", "-unsigned", "-cmd", "LOAD prql; LOAD httpfs; LOAD json; LOAD parquet; LOAD postgres_scanner; LOAD sqlite_scanner; LOAD substrait;"]
CMD []
