function test_assemble_html () {
  local title=$1
  local expected_value=$2
  local sidebar=$3
  local cards=$4
  local css_file=$5
  local actual_value=$( assemble_html "${sidebar}" "${cards}" "${css_file}" 2> /dev/null)

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function assemble_html_test_cases () {
  echo "Assemble html test cases."

  local title="Should assemble cards of html page and sidebar."
  local expected_value=$( cat tests/resources/expected_html_page.txt )
  local sidebar=$( cat tests/resources/input_sidebar.txt )
  local cards=$( cat tests/resources/input_cards.txt )
  local css_file="pokemon.css"
  test_assemble_html "${title}" "${expected_value}" "${sidebar}" "${cards}" "${css_file}"

  # to get new line after printing test results
  echo
}
