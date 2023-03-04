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

# Install PRQL Extension
# --------------

ARG PRQL_VERSION

RUN duckdb -unsigned -c "SET custom_extension_repository='welsch.lu/duckdb/prql/$PRQL_VERSION'; INSTALL prql;"

ENTRYPOINT ["/usr/local/bin/duckdb", "-unsigned", "-cmd", "LOAD prql;"]
CMD []
