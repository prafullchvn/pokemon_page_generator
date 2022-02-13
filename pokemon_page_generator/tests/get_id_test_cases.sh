function test_get_id () {
  local title=$1
  local expected_value=$2
  local record=$3
  local actual_value=$( get_id "${record}")

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function get_id_test_cases () {
  echo "Get id test cases."

  local title="Should give id ."
  local expected_value="1"
  local record="1|bulbasaur|grass,poison|45|45|64|49|49|69"
  test_get_id "${title}" "${expected_value}" "${record}"

  # to get new line after printing test result
  echo
}