function test_create_stats_table () {
  local title=$1
  local expected_stats_table=$2
  local actual_stats_table=$3

  local test_result="FAIL"
  if [[ "${expected_stats_table}" == "${actual_stats_table}" ]]
  then
    test_result="PASS"
  fi

  echo "${test_result};${title};"
}

function create_stats_table_test_cases () {
  echo "Create stats table test cases."

  local title="Should generate html code for stats table."
  # local stats_values="45|45|64|49|49|69"
  local speed="45"
  local hp="45"
  local base_xp="64"
  local attack="49"
  local defense="49"
  local weight="69"
  local expected_stats_table=$( cat tests/resources/expected_stats_table.txt )

  local actual_stats_table=$( create_stats_table "${speed}" "${hp}" "${base_xp}" "${attack}" "${defense}" "${weight}" 2> /dev/null)

  test_create_stats_table "${title}" "${expected_stats_table}" "${actual_stats_table}"

  # to get a new line after printing test result
  echo
}