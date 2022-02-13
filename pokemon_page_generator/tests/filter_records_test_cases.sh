function test_filter_records () {
  local title=$1
  local expected_value=$2
  local records=$3
  local type=$4
  local actual_value=$( filter_records "${records}" "${type}" 2> /dev/null)

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function filter_records_test_cases () {
  echo "Get records test cases."

  local title="Should get the records of given type."
  local type="grass"
  local records="46|paras|bug,grass|25|35|57|70|55|54
47|parasect|bug,grass|30|60|142|95|80|295
48|venonat|bug,poison|45|60|61|55|50|300
49|venomoth|bug,poison|90|70|158|65|60|125
50|diglett|ground|95|10|53|55|25|8"

  local expected_value="46|paras|bug,grass|25|35|57|70|55|54
47|parasect|bug,grass|30|60|142|95|80|295"

  test_filter_records "${title}" "${expected_value}" "${records}" "${type}"

  title="Should return all records when type is all."
  expected_value="${records}"
  type="all"
  test_filter_records "${title}" "${expected_value}" "${records}" "${type}"

  # to get a new line after printing result
  echo
}

