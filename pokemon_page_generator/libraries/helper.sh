
function generate_tag () {
  local tag=$1
  local attributes=$2
  local content=$3

  [[ "${attributes}" != "" ]] && attributes=" ${attributes}"
  echo "<${tag}${attributes}>${content}</${tag}>"
}


function capitalize () {
  local word=$1
  local first_char=$( tr "[:lower:]" "[:upper:]" <<< "${word:0:1}")

  echo "${first_char}${word:1}"
}


function get_categories () {
  local records=$1
  local categories=$( echo "${records}" | cut -d"|" -f3 )
  categories=$( echo -e "all\n${categories}" | tr "," "\n" | sort | uniq )
  echo ${categories}
}


function filter_records () {
  local records=$1
  local type=$2

  if [[ "${type}" == "all" ]] ; then
    echo "${records}"
    return
  fi

  grep "^.*|.*|.*${type}" <<< "${records}"
}


function get_field () {
  local records=$1
  local field_number=$2

  echo "${records}" | cut -d"|" -f"${field_number}" 
}


function get_id () {
  local record=$1
  get_field "${record}" "1"
}

function get_pokemon_name () {
  local record=$1
  get_field "${record}" "2"
}

function get_types () {
  local record=$1
  get_field "${record}" "3"
}

function get_speed () {
  local record=$1
  get_field "${record}" "4"
}

function get_hp () {
  local record=$1
  get_field "${record}" "5"
}

function get_base_xp () {
  local record=$1
  get_field "${record}" "6"
}

function get_attack () {
  local record=$1
  get_field "${record}" "7"
}

function get_defense () {
  local record=$1
  get_field "${record}" "8"
}

function get_weight () {
  local record=$1
  get_field "${record}" "9"
}

function create_th () {
  local value=$1

  generate_tag "th" "" "${value}"
}

function create_td () {
  local value=$1

  generate_tag "td" "" "${value}"
}

function create_row () {
  local property=$1
  local value=$2

  local th=$( create_th "${property}" )
  local td=$( create_td "${value}" )

  generate_tag "tr" "" "${th}${td}"
}

function generate_pokemon_image () {
  local pokemon_name=$1
  local capitalized_name=$( capitalize "${pokemon_name}" )
  
  local src=$( generate_attribute "src" "images/${pokemon_name}.png" )
  local alt=$( generate_attribute "alt" "${capitalized_name}" )
  local title=$( generate_attribute "title" "${capitalized_name}" )
  echo "<img ${src} ${alt} ${title}>"
}

function generate_link () {
  local css_file=$1 
  local href=$( generate_attribute "href" "css/${css_file}" )
  local rel=$( generate_attribute "rel" "stylesheet" )
 
  echo "<link ${rel} ${href}>"
}

function generate_attribute () {
  local attribute=$1
  local value=$2

  echo "${attribute}=\"${value}\""
}

function generate_class () {
  local value=$1

  generate_attribute "class" "${value}"
}

function generate_li () {
  local category=$1
  local class=$2

  local href=$( generate_attribute "href" "${category}.html") 
  local anchor=$( generate_tag "a" "${href}" "${category}" )
  local li=$( generate_tag "li" "${class}" "${anchor}" )
  echo "${li}"
}
