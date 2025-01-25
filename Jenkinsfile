pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {

        stage('Configure Git') {
            steps {
                sh 'git config --global user.email "ogbonniachibundu@gmail.com'
                sh 'git config --global user.name "Jenkins CI"'
            }
        }

        stage('Clone Repository'){
            steps{
                git branch: 'main', url: 'https://github.com/Dumken1/c-jenkins-project.git'
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