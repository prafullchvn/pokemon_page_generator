function test_generate_cards () {
  local title=$1
  local input_records=$2
  local expected_cards=$3

  local actual_cards=$( generate_cards "${input_records}" 2> /dev/null)
  local test_result="FAIL"

  [[ "${actual_cards}" == "${expected_cards}" ]] && test_result="PASS"

  echo "${test_result};${title};" 

}

function generate_cards_test_cases () {
  echo "Generate cards test cases"

  local title="Should generate cards from given records."
  local input_records="1|bulbasaur|grass,poison|45|45|64|49|49|69
2|ivysaur|grass,poison|60|60|142|62|63|130"
  local expected_cards=$( cat tests/resources/expected_cards.txt )

  test_generate_cards "${title}" "${input_records}" "${expected_cards}"

  #new line after test results
  echo
}