#!/bin/bash

echo "Building the project"
echo "Files in present working Directory"
ls -al
if pip3 install -t ./layer/python -r requirements.txt;
then
    echo "Packages installed successfully !!!!!"
    echo "Building the project"
mkdir ./.aws-sam && chmod 777 -R ./.aws-sam
    sam build
    echo "Deploying the project"

    sam deploy --stack-name demo-python \
    --region ap-south-1 \
    --s3-bucket bucket-dj-2024 \
    --capabilities CAPABILITY_IAM \
    --no-confirm-changeset 2>&1 | tee output.txt
    cat output.txt | grep -i 'No changes to deploy';

    ls -al 

    if cat output.txt | grep -i 'Successfully created/updated stack'  > /dev/null ;
    then
        echo "Stack Deployed Successfully !!!!"
        exit 0;
    elif cat output.txt | grep -i 'No changes to deploy' > /dev/null;
    then
        echo "No changes to deploy"
        exit 0;
    else
        echo "Error found";
    fi

else
    echo "Packages not installed"
    exit 0
fi
