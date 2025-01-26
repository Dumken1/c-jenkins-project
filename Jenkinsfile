pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {
        stage('Set Git identity') {
            steps {
                sh """
                  git config --global user.email "jenkins@example.com"
                  git config --global user.name  "Jenkins CI"
                """
            }
        }
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Commit/Tag') {
            steps {
                // do the commit, tag, etc. here
                sh 'git tag -a -f -m "Jenkins Build" jenkins-C_Test_Project-18'
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