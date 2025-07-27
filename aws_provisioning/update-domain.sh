aws cloudformation update-stack \
    --stack-name team5-sagemaker \
    --template-body file://sagemaker_create_domain.yaml \
    --parameters file://parameters.json \
    --capabilities CAPABILITY_NAMED_IAM
