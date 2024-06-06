pipeline {
    agent any
    stages {
        stage('Prepare environment') {
            steps {
                script{
                    sh 'bash ./bash/install_docker'
                    
                }
            }
        }
        stage('Build image'){
            steps{
              sh 'terraform -chdir=terraform init'
              sh 'terraform -chdir=terraform plan -out=../planfile'
              sh 'terraform -chdir=terraform apply -auto-approve ../planfile'          
            }
        }
    }
}
