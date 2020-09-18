token=$1
project_id=$2
file_id=$3
file=$4

echo "Crowdin.sh"

echo "Upload file $file"

filename=$(basename $file)

storage_id=$(curl --request POST \
  --url https://crowdin.com/api/v2/storages \
  --header "authorization: Bearer $token" \
  --header 'content-type: application/octet-stream' \
  --header "crowdin-api-filename: $filename" \
  --data @$file | jq '.data.id')

echo "Upload file as $storage_id"

curl --request PUT \
  --url "https://crowdin.com/api/v2/projects/${project_id}/files/${file_id}" \
  --header "authorization: Bearer $token" \
  --header 'content-type: application/json' \
  --data "{\"storageId\": $storage_id}"




