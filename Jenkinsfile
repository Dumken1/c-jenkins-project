pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {
        stage('Pull Repository') {
            steps {
                sshagent(['7346eab3-f036-485f-b79b-380e049430d9']) {
                    sh 'git pull git@github.com:Dumken1/c-jenkins-project.git'
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