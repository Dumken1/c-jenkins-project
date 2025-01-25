pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {
        stage('Clone Repository'){
            steps{
                git 'https://github.com/Dumken1/c-jenkins-project.git'
            }
        }

        stage(name: 'Build'){
            step{
                sh 'make'
            }
        }

        stage(name: 'Test'){
            step{
                sh 'make test'
            }
        }
    }

    post{
        success{
            echo(message: 'Project build and Test successful')
        }
        failure{
            echo(message: 'Build failed')
        }
    }
}