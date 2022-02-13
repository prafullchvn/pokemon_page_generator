#! /bin/bash

source libraries/html_pages_generator.sh
source libraries/helper.sh
source libraries/init.sh
source libraries/sidebar.sh
source libraries/card.sh

source tests/create_card_test_cases.sh
source tests/capitalize_test_cases.sh
source tests/generate_card_html_test_cases.sh
source tests/generate_cards_test_cases.sh
source tests/get_field_test_cases.sh
source tests/create_stats_table_test_cases.sh
source tests/filter_records_test_cases.sh
source tests/generate_sidebar_test_cases.sh
source tests/assemble_html_test_cases.sh
source tests/create_page_test_cases.sh
source tests/get_categories_test_cases.sh
source tests/main_test_cases.sh
source tests/init_project_test_cases.sh
source tests/copy_css_file_test_cases.sh
source tests/copy_images_test_cases.sh
source tests/generate_tag_test_cases.sh
source tests/generate_list_items_test_cases.sh
source tests/create_row_test_cases.sh
source tests/get_id_test_cases.sh

RED="\033[0;31m"
GREEN="\033[0;32m"
BOLD="\033[1m"
NORMAL="\033[0m"

function run_tests () {
  # create_card_test_cases
  # capitalize_test_cases
  # generate_card_html_test_cases
  # generate_cards_test_cases
  # get_field_test_cases
  # create_stats_table_test_cases
  # filter_records_test_cases
  # generate_sidebar_test_cases
  # assemble_html_test_cases
  create_page_test_cases
  # get_categories_test_cases
  # init_project_test_cases
  # main_test_cases
  # copy_css_file_test_cases
  # copy_images_test_cases
  # generate_tag_test_cases
  # generate_list_items_test_cases
  # create_row_test_cases
  # get_id_test_cases
}

function generate_report () {
  local test_results=$1

  local results_to_be_displayed=$(
    echo "${test_results}" | cut -d";" -f1,2 | tr ";" "\t" 
  )
  results_to_be_displayed=$( change_to_emoji "${results_to_be_displayed}")

  local failed_test_cases=$(
    echo "${test_results}" | grep "^FAIL" | cut -d";" -f2- | tr ";" "\n" 
  )

  echo "${results_to_be_displayed}"
  if [[ ${failed_test_cases} != "" ]] ; then 
    echo -e "\nFailed Test Cases\n"
    echo "${failed_test_cases}"
  fi
}

function change_to_emoji () {
  local test_results=$1
  local red="\033[0;31m"
  local green="\033[0;32m"
  local normal="\033[0m"

  local tick=$( echo -e "${green}✔${normal}" )
  local cross=$( echo -e "${red}✗${normal}" )

  echo "$test_results" | sed "s:^PASS:${tick}: ; s:^FAIL:${cross}:" 

}


generate_report "$(run_tests)"