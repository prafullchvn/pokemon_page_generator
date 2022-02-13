function test_generate_card_html () {
  local title=$1
  local expected_card=$2
  local id=$3
  local pokemon_name=$4
  local types=$5
  local stats_table=$6
  local actual_card=$( generate_card_html "${id}" "${pokemon_name}" "${types}" "${stats_table}" )

  local test_result="FAIL"
  [[ ${actual_card} == ${expected_card} ]] && test_result="PASS"
  
  echo "${test_result};${title};"
}

function generate_card_html_test_cases () {
  echo "Generate card html test cases."

  local title="Should return html of card."
  local expected_card=$( cat tests/resources/expected_card.txt )
  local id="1"
  local pokemon_name="bulbasaur"
  local types="<div class=\"type grass\">Grass</div><div class=\"type poison\">Poison</div>"
  local stats_table="<div class=\"stats\"><table class=\"stats-table\"><tr><th>Weight</th><td>69</td></tr><tr><th>Base XP</th><td>64</td></tr><tr><th>HP</th><td>45</td></tr><tr><th>Attack</th><td>49</td></tr><tr><th>Defense</th><td>49</td></tr><tr><th>Speed</th><td>45</td></tr></table></div>"
  test_generate_card_html "${title}" "${expected_card}"  "${id}" "${pokemon_name}" "${types}" "${stats_table}"
  
  #new line after test results
  echo
}
