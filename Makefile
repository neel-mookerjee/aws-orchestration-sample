AWS_CFN_TEMPLATE_S3_BUCKET := "aws-orchestration-sample"

check-var = $(if $(strip $($1)),,$(error var for "$1" is empty))

default: help

require_deployrole:
	$(call check-var,deployrole)

cfn/create: require_deployrole ## Create the sample cloudformation stack. vars: deployrole. Example: make cfn/create deployrole="arn:aws:iam::123456789012:role/deployRole"
	@aws s3 cp ./cloudformation/nested.json s3://$(AWS_CFN_TEMPLATE_S3_BUCKET)/cloudformation/nested.json
	@aws s3 cp ./cloudformation/main.json s3://$(AWS_CFN_TEMPLATE_S3_BUCKET)/cloudformation/main.json
	@aws cloudformation create-stack --stack-name aws-cloudformation-sample --template-url https://$(AWS_CFN_TEMPLATE_S3_BUCKET).s3-us-west-2.amazonaws.com/cloudformation/main.json --parameters ParameterKey=DeployRoleARN,ParameterValue=$(deployrole) --capabilities CAPABILITY_IAM
	@echo "Cloudformation stack creation initiated."

cfn/delete: ## Delete the sample cloudformation stack. 
	@aws cloudformation delete-stack --stack-name aws-cloudformation-sample
	@echo "Cloudformation stack deletion initiated."

tf/plan: ## Plan the sample terraform stack. Make changes to the variable.tf file. 
	@cd terraform && terraform plan

tf/apply: ## Create the sample terraform stack. Make changes to the variable.tf file. 
	@cd terraform && terraform apply

tf/destroy: ## Create the sample terraform stack. Make changes to the variable.tf file. 
	@cd terraform && terraform destroy

help: ## This is default and it helps
	@echo "\n  ## AWS-ORCHESTRATION-SAMPLE\n"
	@awk 'BEGIN {FS = ":.*?## "} /^[\/a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "  \033[36maws-orchestration-sample =>    make \033[0m%-25s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo

