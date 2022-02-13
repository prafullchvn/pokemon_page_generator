function copy_images () {
  local resource_path=$1
  local pokemon_names=$2
  local dest_images_folder=$3
  local source_dir="${resource_path}/images"

  local images=""
  for pokemon in ${pokemon_names}
  do
    if [[ ! -e "${source_dir}/${pokemon}.png" ]] ; then
      echo "${pokemon}.png doesn't exist."
      exit
    fi
    images+="${source_dir}/${pokemon}.png "
  done

  cp ${images} "${dest_images_folder}" 
}

function copy_css_file () {
  local resource_path=$1
  local css_file=$2
  local dest_css_folder=$3
  local source_dir="${resource_path}/css"

  if [[ ! -e "${source_dir}/${css_file}" ]] ; then
    echo "${css_file} doesn't exist."
    exit
  fi
  
  cp -r "${source_dir}/" "${dest_css_folder}"
}

function init_project () {
  local resource_path=$1
  local pokemon_names=$2
  local css_file=$3
  local project_name=$4

  local dest_css_folder="${project_name}/css"
  local dest_images_folder="${project_name}/images"

  mkdir -p "${dest_css_folder}" "${dest_images_folder}"
  
  copy_css_file "${resource_path}" "${css_file}" "${dest_css_folder}"
  copy_images  "${resource_path}" "${pokemon_names}" "${dest_images_folder}"
}