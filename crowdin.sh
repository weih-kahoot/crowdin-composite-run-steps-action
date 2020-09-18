token=$1
project_id=$2
file=$3

echo "Crowdin.sh"

echo "Upload file $file"

curl --request POST \
  --url https://crowdin.com/api/v2/storages \
  --header "authorization: Bearer $token" \
  --header 'content-type: application/octet-stream' \
  --header "crowdin-api-filename: $file" \
  --data @$file

# ls

# date


