
function test_copy_css_file () {
  local title=$1
  local resource_path=$2
  local css_file=$3
  local project_name=$4
  
  mkdir -p "${project_name}/css"

  copy_css_file "${resource_path}" "${css_file}" "${project_name}/css" 2> /dev/null

  local test_result="FAIL"
  [[ -e "${project_name}/css/${css_file}" ]] && test_result="PASS"

  echo "${test_result};${title};"

  rm -r "${project_name}"
}

function copy_css_file_test_cases () {
  echo "Copy css file test cases."

  local title="Should copy the css file into css folder of project."
  local resource_path="resources"
  local css_file="pokemon.css"
  local project_name="Pokemon"

  test_copy_css_file "${title}" "${resource_path}" "${css_file}" "${project_name}"

  # to get new line after printing the test results
  echo
}
