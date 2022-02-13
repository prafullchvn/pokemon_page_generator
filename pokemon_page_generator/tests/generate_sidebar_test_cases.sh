function test_generate_sidebar () {
  local title=$1
  local expected_value=$2
  local categories=$3
  local selected_category=$4

  local actual_value=$( generate_sidebar "${categories}" "${selected_category}" 2> /dev/null)

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function generate_sidebar_test_cases () {
  echo "Generate sidebar test cases."

  local title="Should generate sidebar with given category."
  local expected_value=$( cat tests/resources/expected_sidebar.txt )
  local categories="all grass fire"
  local selected_category="grass"

  test_generate_sidebar "${title}" "${expected_value}" "${categories}" "${selected_category}"

  # to get new line after printing test result
  echo
}
