
function test_capitalize () {
  local title=$1
  local input_word=$2
  local expected_word=$3
  local actual_word=$( capitalize "$input_word" )

  local test_result="FAIL"
  [[ "${expected_word}" == "${actual_word}" ]] && test_result="PASS"

  # echo "$title"
  local test_values="Actual:${actual_word};Expected:${expected_word}"

  echo "${test_result};${title};${test_values};Input:${input_word};"
}

function capitalize_test_cases () {
  # local function_name="capitalize_testcases"
  echo "Capitalize Test Cases"

  local title="Should capitalize the given word."
  local input_word="apple"
  local expected_word="Apple"
  test_capitalize "${title}" "${input_word}" "${expected_word}"

  #new line after test results
  echo
}
