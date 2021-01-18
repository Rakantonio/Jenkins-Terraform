properties([pipelineTriggers([githubPush()])])

pipeline {
    agent {
        environment {
	    AWS_ACCESS_KEY_ID	  = credentials('AKIAXEQG34BCPF7SIBUC')
	    AWS_SECRET_ACCESS_KEY = credentials('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')
	    region		  = eu-west-3
	}
	docker {
	    image 'hashicorp/terraform'
	    args '--entrypoint='	
	}
    }
    stages {
	stage('Init Terraform directory') {
	    steps {
		sh 'terraform init'
	    }
	}
	stage('Plan terraform code') {
	    steps {
		sh 'terraform plan'
	    }
	}
	stage('Apply terraform code') {
	    steps {
		sh 'terraform apply -auto-approve'
	    }
	}
    }
}
