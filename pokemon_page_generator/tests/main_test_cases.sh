function test_main () {
  local title=$1
  local expected_value=$2
  local record_file=$3
  local expected_files=$4
  local resource_path=$5
  local css_file=$6
  local project_name=$7
  local actual_value=""
  
  main "${record_file}" "${css_file}" "${resource_path}" "${project_name}" &> /dev/null

  actual_value=$(
    for file in ${expected_files}
    do
      cat "${project_name}/${file}"
    done
  )

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"

  rm -r "${project_name}"
}

function main_test_cases () {
  echo "Main test cases"

  local title="Should generate html pages for all categories"
  local expected_value=$( cat tests/resources/expected_page_from_main.txt )
  local record_file="tests/resources/test_records_file.csv"
  local expected_files="all.html grass.html poison.html"
  local resource_path="resources"
  local css_file="pokemon.css"
  local project_name="pokemon"

  test_main "${title}" "${expected_value}" "${record_file}" "${expected_files}" "${resource_path}" "${css_file}" "${project_name}"

  # to get new line after printing test result
  echo
}