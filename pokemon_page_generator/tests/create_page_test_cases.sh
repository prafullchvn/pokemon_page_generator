function create_page_test_cases () {
  echo "Generate html test cases."

  local title="Should generate page for given category."
  local expected_value=$( cat tests/resources/expected_html_page.txt )
  local records="1|bulbasaur|grass,poison|45|45|64|49|49|69
2|ivysaur|grass,poison|60|60|142|62|63|130"
  local categories="all electric fire grass poison"
  local selected_category="grass"
  local css_file="pokemon.css"

  local actual_value=$( create_page "${records}" "${categories}" "${selected_category}" "${css_file}" 2> /dev/null )

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}