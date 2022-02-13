function test_create_row () {
  local title=$1
  local expected_value=$2
  local property=$3
  local value=$4

  local actual_value=$( create_row "${property}" "${value}" 2> /dev/null )

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function create_row_test_cases () {
  echo "Create row test cases."

  local title="Should create rows with given data."
  local expected_value="<tr><th>HP</th><td>100</td></tr>"
  local property="HP"
  local value="100"

  test_create_row "${title}" "${expected_value}" "${property}" "${value}"

  # to get new line after printing test result
  echo
}