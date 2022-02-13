function test_get_categories () {
  local title=$1
  local expected_value=$2
  local records=$3

  local actual_value=$( get_categories "${records}" 2> /dev/null )

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function get_categories_test_cases () {
  echo "Get categories test cases."

  local title="Should return all categories in alphabetical order."
  local expected_value="all electric fire grass poison"
  local records="1|bulbasaur|grass,poison|45|45|64|49|49|69
2|ivysaur|grass,poison|60|60|142|62|63|130
5|charmeleon|fire|80|58|142|64|58|190
25|pikachu|electric|90|35|112|55|40|60"
  test_get_categories "${title}" "${expected_value}" "${records}"

  # to get new line after printing test result
  echo
} 