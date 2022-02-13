
function test_copy_images () {
  local title=$1
  local expected_files=$2
  local resource_path=$3
  local pokemon_names=$4
  local project_name=$5
  
  mkdir -p "${project_name}/images"

  copy_images "${resource_path}" "${pokemon_names}" "${project_name}/images"
  local actual_files=$( ls ${project_name}/images | xargs echo )

  local test_result="FAIL"
  [[ "${expected_files}" == "${actual_files}" ]] && test_result="PASS"

  echo "${test_result};${title};"

  rm -r "${project_name}"
}

function copy_images_test_cases () {
  echo "Copy images test cases."

  local title="Should copy all images of given pokemon names."
  local expected_files="bulbasaur.png ivysaur.png"
  local resource_path="resources"
  local pokemon_names="bulbasaur ivysaur"
  local project_name="pokemon"
  test_copy_images "${title}" "${expected_files}" "${resource_path}" "${pokemon_names}" "${project_name}"

  #to get a new line after printing test result
  echo
}