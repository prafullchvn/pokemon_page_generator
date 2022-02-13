
function generate_list_items () {
  local categories=$1
  local selected_category=$2

  for category in $categories
  do
    local class=$( generate_class "category")
    if [[ "${category}" == "${selected_category}" ]]
    then
      class=$( generate_class "selected ${category} category") 
    fi

    li=$( generate_li "${category}" "${class}")
    
    echo "${li}"
  done

}

function generate_sidebar () {
  local categories=$1
  local selected_category=$2

  local ul_class=$( generate_class "categories" )
  local nav_class=$( generate_class "sidebar" ) 

  local list_items=$( generate_list_items "${categories}" "${selected_category}" )
  local unordered_list=$( generate_tag "ul" "${ul_class}" "${list_items}" )
  local nav_tag=$( generate_tag "nav" "${nav_class}" "${unordered_list}" )

  echo "${nav_tag}"
}
