curl -s -X POST   http://localhost:44081/registerUser   -H "content-type: application/json"   -d '{
  "orgname":"org1"
}'
curl -s -X POST   http://localhost:44081/registerUser   -H "content-type: application/json"   -d '{
  "orgname":"org2"
}'


curl -s -X POST   http://localhost:44081/channels   -H "content-type: application/json"   -d '{
  "orgname":"org1",
  "channelName":"mycc2",
  "channelConfigPath":"../artifacts/channel-artifacts/mycc2.tx"
}'

curl -s -X POST   http://localhost:44081/joinchannel   -H "content-type: application/json"   -d '{
  "orgname":"org1",
  "channelName":"mycc2"
}'

curl -s -X POST   http://localhost:44081/joinchannel   -H "content-type: application/json"   -d '{
  "orgname":"org2",
  "channelName":"mycc2"
}'

curl -s -X POST   http://localhost:44081/chaincodes   -H "content-type: application/json"   -d '{
  "orgname":"akc",
  "chaincodeId":"fabcartest",
  "chaincodePath":"chaincodes/fabcar",
  "chaincodeVersion":"v1.9",
  "metadata_path": "chaincodes/fabcar/META-INF/",
  "chaincodeType":"golang"
}'
curl -s -X POST   http://localhost:44081/chaincodes   -H "content-type: application/json"   -d '{
  "orgname":"frt",
  "chaincodeId":"fabcartest",
  "chaincodePath":"chaincodes/fabcar",
  "chaincodeVersion":"v1.9",
  "metadata_path": "chaincodes/fabcar/META-INF/",
  "chaincodeType":"golang"
}'
initchaincodes
upgradeChainCode
curl -s -X POST   http://localhost:44081/initchaincodes   -H "content-type: application/json"   -d '{
  "orgname":"akc",
  "channelName":"mycc",
  "chaincodeId":"fabcartest",
  "chaincodeVersion":"v1.9",
  "chaincodeType":"golang",
  "args":[]
}'

curl -s -X POST   http://localhost:44081/invokeChainCode   -H "content-type: application/json"   -d '{
  "username":"org1",
  "orgname":"org1",
  "channelName":"mycc2",
  "chaincodeId":"cathaycc",
  "chaincodeVersion":"v1.0",
  "chaincodeType":"golang",
  "fcn": ["createMember"]
  "args":["{\"MerchantID\": \"1\", \"PointExchangeRate\": \"1\", \"BaseUnit\": \"1\"}"]
}'
curl -s -X POST   http://localhost:44081/invokeChainCode   -H "content-type: application/json"   -d '{
  "username":"org1",
  "orgname":"org1",
  "channelName":"mycc2",
  "chaincodeId":"fabcar",
  "chaincodeVersion":"v1.0",
  "chaincodeType":"golang",
  "fcn": ["",""]
  "args":[]
}'

curl -s -X POST   http://localhost:44081/queryChainCode   -H "content-type: application/json"   -d '{
  "username":"org1",
  "orgname":"org1",
  "channelName":"mycc2",
  "chaincodeId":"fabcar",
  "fcn": ["",""]
  "args":[]
}'
