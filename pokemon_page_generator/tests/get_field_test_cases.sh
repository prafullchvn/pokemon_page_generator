
function test_get_field () {
  local title=$1
  local expected_value=$2
  local record=$3
  local field_number=$4

  local actual_value=$( get_field "${record}" "${field_number}" 2> /dev/null )

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]]  && test_result="PASS"

  echo "${test_result};${title};Expected:${expected_value};Actual:${actual};Input:${record} - $field_number;"
}

function get_field_test_cases () {
  echo "Get field test cases"

  local title="Should give the value of the field number from given record."
  local record="1|bulbasaur|grass,poison|45|45|64|49|49|69"
  local field_number="2"
  local expected_value="bulbasaur"
  test_get_field "${title}" "${expected_value}" "${record}" "${field_number}"

  #new line after test results
  echo
}

