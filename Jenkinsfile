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

        stage('Tag and Push') {
            steps {
                sh 'git tag -a v1.2.4 -m "Tag created by Jenkins"'
                sh 'git push origin v1.2.4'
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