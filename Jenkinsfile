pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {

        stage('Configure Git') {
            steps {
                sh 'git config user.email "chibunduogbonnia@gmail.com'
                sh 'git config user.name "Chibundu Ogbonnia"'
            }
        }

        stage('Clone Repository'){
            steps{
                git 'https://github.com/Dumken1/c-jenkins-project.git'
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