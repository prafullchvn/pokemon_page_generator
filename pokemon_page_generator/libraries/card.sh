
function generate_types_html () {
  local types=$1
  local types_html=""

  local old_ifs=$IFS
  IFS=$','

  for type in $types
  do
    local capitalized_type=$( capitalize "${type}" )
    local class=$( generate_class "type ${type}" )
    types_html+=$( generate_tag "div" "${class}" "${capitalized_type}" )
  done

  IFS=$old_ifs
  echo "${types_html}"
}


function create_stats_table () {
  local speed=$1
  local hp=$2
  local base_xp=$3
  local attack=$4
  local defense=$5
  local weight=$6
  local properties=("Weight" "Base XP" "HP" "Attack" "Defense" "Speed")
  local values=(${weight} ${base_xp} ${hp} ${attack} ${defense} ${speed})

  local index=0
  while (( ${index} < ${#properties[@]} )) ; do
    local table_rows+=$(
      create_row "${properties[${index}]}" "${values[${index}]}"
    )
    (( index++ ))
  done
  
  local stats_table_class=$( generate_class "stats-table" )
  local div_class=$( generate_class "stats" )
  local stats_table=$( generate_tag "table" "${stats_table_class}" "${table_rows}" )
  generate_tag "div" "${div_class}" "${stats_table}"

}


function generate_card_html () {
  local id=$1
  local pokemon_name=$2
  local types=$3
  local stats_table=$4
  local capitalized_name=$( capitalize "${pokemon_name}" )
  
  local pokemon_image=$( generate_pokemon_image "${pokemon_name}" )

  local image_wrapper_class=$( generate_class "pokemon-image" )
  local image_wrapper=$( generate_tag "div" "${image_wrapper_class}" "${pokemon_image}" )
  
  local card_title=$( generate_tag "h2" "" "${capitalized_name}" )
  local header_content="${card_title}${types}"
  
  local header=$( generate_tag "header" "" "${header_content}" )
  local pokemon_details="${header}${stats_table}"

  local wrapper_class=$( generate_class "pokemon-details" )
  local pokemon_details_wrapper=$( generate_tag "div" "${wrapper_class}"  "${pokemon_details}" )
  local pokemon_card_contents="${image_wrapper}${pokemon_details_wrapper}"
  
  local pokemon_card_attributes=$( generate_attribute "id" "${id}" )
  pokemon_card_attributes+=" "$( generate_class "pokemon-card" )
  local pokemon_card=$( generate_tag "div" "${pokemon_card_attributes}" "${pokemon_card_contents}" )

  echo "${pokemon_card}"
}


function create_card () {
  local record=$1
  local id=$( get_id "${record}")
  local pokemon_name=$( get_pokemon_name "${record}")
  local types=$( get_types "${record}")
  local speed=$( get_speed "${record}")
  local hp=$( get_hp "${record}")
  local base_xp=$( get_base_xp "${record}")
  local attack=$( get_attack "${record}")
  local defense=$( get_defense "${record}")
  local weight=$( get_weight "${record}")

  local types_html=$( generate_types_html "${types}" )
  local stats_table=$( create_stats_table "${speed}" "${hp}" "${base_xp}" "${attack}" "${defense}" "${weight}" )

  generate_card_html "${id}" "${pokemon_name}" "${types_html}" "${stats_table}"
}



function generate_cards () {
  local records=$1
  local cards=""

  local old_ifs=$IFS
  IFS=$'\n'
  for record in `echo "$records"`
  do 
    create_card "${record}"
  done
  IFS=$old_ifs
}
