function test_generate_tag () {
  local title=$1
  local expected_value=$2
  local tag=$3
  local attributes=$4
  local content=$5

  local actual_value=$( generate_tag "${tag}" "${attributes}" "${content}" )

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function generate_tag_test_cases () {
  echo "Generate tag test cases."

  local title="Should generate html tag with given parameters."
  local expected_value='<div class="title">This is content</div>'
  local tag="div"
  local attributes='class="title"'
  local content="This is content"

  test_generate_tag "${title}" "${expected_value}" "${tag}" "${attributes}" "${content}"

  #to get a new line after printing test result
  echo
}
