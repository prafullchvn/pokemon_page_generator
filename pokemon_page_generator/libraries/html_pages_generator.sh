source libraries/helper.sh
source libraries/card.sh
source libraries/sidebar.sh
source libraries/init.sh

function assemble_html () {
  local sidebar=$1
  local cards=$2
  local css_file=$3

  local wrapper_class=$( generate_class "pokemon-cards" ) 
  local pokemon_cards_wrapper=$(generate_tag "div" "${wrapper_class}" "${cards}")
  local main=$(generate_tag "main" "" "${sidebar}${pokemon_cards_wrapper}")
  local body=$(generate_tag "body" "" "${main}")
  local title=$(generate_tag "title" "" "Pokemon")
  local link=$(generate_link "${css_file}")
  local head=$(generate_tag "head" "" "${title}${link}")
  local html=$(generate_tag "html" "" "${head}${body}")
  
  echo "${html}"
}

function create_page () {
  local records=$1
  local categories=$2
  local selected_category=$3
  local css_file=$4

  local sidebar=$( generate_sidebar "${categories}" "${selected_category}" )
  local cards=$( generate_cards "${records}" )
  local pokemon_webpage=$( assemble_html "${sidebar}" "${cards}" "${css_file}" )

  echo "${pokemon_webpage}"
}

function generate_pages () {
  local records=$1
  local project_name=$2
  local css_file=$3

  local pokemon_categories=$( get_categories "${records}" )
  for current_category in ${pokemon_categories}
  do
    local filtered_records=$( filter_records "${records}" "${current_category}" )
  
    local destination_path="${project_name}/${current_category}.html"
    echo -n "Creating ${current_category}.html ..."
    create_page "${filtered_records}" "${pokemon_categories}" "${current_category}" "${css_file}" > "${destination_path}"
    echo "Done."
  done
}
function main () {
  local record_file=$1
  local css_file=$2
  local resource_path=$3
  local project_name=$4
  local records=$( tail +2 "${record_file}" )
  local pokemon_names=$( get_pokemon_name "${records}" )

  init_project "${resource_path}" "${pokemon_names}" "${css_file}" "${project_name}"

  generate_pages "${records}" "${project_name}" "${css_file}"
}
