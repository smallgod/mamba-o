#!/bin/bash

JSON_DIR="./configs"
JSON_CONTENTS="{\"flat_report_metadata\":[
"

FIRST_FILE=true
for FILENAME in "$JSON_DIR"/*.json; do
  if [ "$FIRST_FILE" = false ]; then
    JSON_CONTENTS="$JSON_CONTENTS,
"
  fi
  JSON_CONTENTS="$JSON_CONTENTS$(cat "$FILENAME")"
  FIRST_FILE=false
done
JSON_CONTENTS="$JSON_CONTENTS]}"

SQL_CONTENTS="
-- \$BEGIN"$'

SET @report_data = \''$JSON_CONTENTS\'';

CALL sp_extract_report_metadata(@report_data, '\''mamba_dim_concept_metadata'\'');'"

-- \$END"

echo "$SQL_CONTENTS" > output.sql
