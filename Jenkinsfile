pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    stages{
        // stage('Install AWS CLI') {
        //    steps {
        //     sh 'sudo apt-get update'
        //     sh 'sudo apt-get install awscli -y'
        //     }
        // }
        stage('Git Checkout'){
            steps{
                git url: 'https://github.com/l124p/iba_dp.git', branch: 'main'
            }
        }
        stage('Terraform init'){
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: "aws",
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply'){
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: "aws",
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}
