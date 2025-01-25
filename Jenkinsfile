pipeline{
    agent any 

    environment {
        CC = 'gcc'
        CFLAG = '-Wall -Werror -g'
    }

    stages {

        stage('Debug Environment') {
            steps {
                sh '''
                    echo "Running as user: $(whoami)"
                    echo "Current directory: $(pwd)"
                    git config --global --list || echo "No global Git config found"
                    git config --local --list || echo "No local Git config found"
                '''
            }
        }


        stage('Configure Git') {
            steps {
                sh 'git config --global user.email "chibunduogbonnia@gmail.com'
                sh 'git config --global user.name "Chibundu Ogbonnia"'
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