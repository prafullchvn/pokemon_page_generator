function test_create_card () {
  local title=$1
  local expected_card=$2
  local record=$3

  local actual_card=$( create_card "${record}" )

  local test_result="FAIL"
  [[ "${actual_card}" == "${expected_card}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function create_card_test_cases () {
  echo "Create card test cases"

  local title="Should generate html code of card from given record."
  local record="1|bulbasaur|grass,poison|45|45|64|49|49|69"
  local expected_card=$( cat tests/resources/expected_card.txt )

  test_create_card "${title}" "${expected_card}" "${record}"

  echo
}