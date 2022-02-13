#! /bin/bash

source libraries/html_pages_generator.sh


RECORD_FILE="resources/pokemon.csv"
CSS_FILE="pokemon.css"
RESOURCE_PATH="resources"
PROJECT_NAME="pokemon_webpages"

rm -rf "${PROJECT_NAME}"

main "${RECORD_FILE}" "${CSS_FILE}" "${RESOURCE_PATH}" "${PROJECT_NAME}"