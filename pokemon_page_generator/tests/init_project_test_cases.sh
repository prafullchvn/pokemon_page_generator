function test_init_project () {
  local title=$1
  local expected_files=$2
  local pokemon_names=$3
  local css_file=$4
  local resource_path=$5
  local project_name=$6

  init_project "${resource_path}" "${pokemon_names}" "${css_file}" "${project_name}" 2> /dev/null

  local test_result="PASS"
  for file in ${expected_files}
  do
    if [[ ! -e "${file}" ]] ; then
      test_result="FAIL"
      break
    fi
  done

  echo "${test_result};${title};"

  rm -r "${project_name}"
}

function init_project_test_cases () {
  echo "Init project test cases."

  local title="Should create dirctory structure and copy images and css file."
  local expected_files="pokemon pokemon/images pokemon/css pokemon/images/bulbasaur.png pokemon/images/ivysaur.png pokemon/css/pokemon.css"
  local pokemon_names="bulbasaur ivysaur"
  local css_file="pokemon.css"
  local resource_path="resources"
  local project_name="pokemon"

  test_init_project "${title}" "${expected_files}" "${pokemon_names}" "${css_file}" "${resource_path}" "${project_name}"

  # to get new line after printing test result
  echo
}
