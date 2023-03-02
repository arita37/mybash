#!/bin/sh

echo "DynamoDB setup start!"
echo "Creating DyanmoDB talbes..."

aws --endpoint-url=http://localstack:4566 dynamodb list-tables > /tmp/dynamotables.txt

if [ $? -ne 0 ]
then
echo -e "date : Error occurs while connecting aws dynamodb.. "
fi

for file in `\find /docker-entrypoint-initaws.d/schemas -name '*.json'`;
do
    TABLE_NAME="$(basename -- $file | sed 's/\.[^\.]*$//')"
    echo "Creating $TABLE_NAME"
    if grep -q $TABLE_NAME /tmp/dynamotables.txt; then
        echo "table exists! $TABLE_NAME"
    else
        aws --endpoint-url=http://localstack:4566 dynamodb create-table --cli-input-json file://$file
        echo "table created! $TABLE_NAME"
    fi
done
echo "DynamoDB setup done!"