function test_generate_list_items () {
  local title=$1
  local expected_value=$2
  local categories=$3
  local selected_category=$4

  local actual_value=$( generate_list_items "${categories}" "${selected_category}" 2> /dev/null )

  local test_result="FAIL"
  [[ "${actual_value}" == "${expected_value}" ]] && test_result="PASS"

  echo "${test_result};${title};"
}

function generate_list_items_test_cases () {
  echo "Generate list items test cases."

  local title="Should generate html of list items."
  local expected_value='<li class="category"><a href="all.html">all</a></li>
<li class="selected grass category"><a href="grass.html">grass</a></li>
<li class="category"><a href="fire.html">fire</a></li>'
  local categories="all grass fire"
  local selected_category="grass"

  test_generate_list_items "${title}" "${expected_value}" "${categories}" "${selected_category}"

  # to get new line after printing test results
  echo
}