fmt:
	terraform fmt -recursive -diff ../

plan: fmt
	terraform plan -out=tfplan

apply: fmt
	terraform apply 'tfplan'

destroy:
	terraform destroy
