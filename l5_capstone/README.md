# capstone project for udacity cloud ops course

## Intro


- Project

	- html project
	
		Hello World, my name is (student name)
		
	- tool
	
		nginx
		
	- code
	
		`./project`

- Infra

	- resrouce
	
		aws kubernetes: EKS
		
	- tool
	
		cloudformation
		
	- code
	
		`./infra`
		
- CI/CD

	- tool
	
		- Jenkins
		
		- Kubernetes
		
	- deployment
	
		kubernetes rolling
		
	- code
	
		- `./kubernetes`
		
		- `./Jenkinsfile`
		
	- other
		- aws configure set up by hand
		
		- docker regstry login by hand
		
		- kubernetes auth set up by hand


## Screenshots

- Lint

	- lint error
	
		![](screenshot/lint_error.png)
		
	- lint pass
	
		![](screenshot/lint_pass.png)

- Pipeline & Rolling 
		
	- pipeling & kubernetes rolling
	
		![](screenshot/pipeline&rolling.png)
		
	- ec2
	
		![](screenshot/rolling.png)
		
- Cloudformation
	
	- aws eks console
	
		![](screenshot/aws_eks.png)
	
	- cloudformation stack
	
		![](screenshot/cloudformation_stack.png)
		
	- cloudformation run
		
		![](screenshot/cloudformation_run.png)
		