pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {
        stage('Clone Repository') {
            steps {
                sshagent(['7346eab3-f036-485f-b79b-380e049430d9']) {
                    sh 'git clone git@github.com:Dumken1/c-jenkins-project.git'
                }
            }
        }

        stage('Build'){
            steps{
                sh 'make'
            }
        }

        stage('Test'){
            steps{
                sh 'make test'
            }
        }

        stage('Push') {
            steps {
                sh 'git push origin main'
            }
        }
    }

    post{
        success{
            echo('Project build and Test successful')
        }
        failure{
            echo('Build failed')
        }
    }
}