pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {
        stage('Clone'){
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