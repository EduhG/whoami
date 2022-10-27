pipeline {
    agent any

    options {
        skipStagesAfterUnstable()
    }

    stages {
         stage('Clone repository') { 
            steps { 
                script{
                    checkout scm
                }
            }
        }

        stage('Build Image') { 
            steps { 
                script{
                    app = docker.build("whoami", "--build-arg VERSION=${env.BUILD_NUMBER} .")
                }
            }
        }

        stage('Push Image to ECR') {
            steps {
                script {
                    docker.withRegistry('https://572551389279.dkr.ecr.eu-west-3.amazonaws.com/whoami', 'ecr:eu-west-3:aws-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}