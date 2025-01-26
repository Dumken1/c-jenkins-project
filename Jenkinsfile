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

        stage('Tag') {
            steps {
                sh 'git tag -a v1.2.6 -m "Tag v1.2.6 created by Jenkins"'
                sh 'git push origin v1.2.6'
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