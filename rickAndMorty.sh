MODULE="Modules/RickAndMortyAPI/Sources/RickAndMortyAPI/"

openapi-generator generate -i "rickAndMorty.yaml" -g swift5 -o "rickAndMorty" --additional-properties=useJsonEncodable=false,responseAs=AsyncAwait
rm -r $MODULE""*
cp -R "rickAndMorty/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "rickAndMorty"

