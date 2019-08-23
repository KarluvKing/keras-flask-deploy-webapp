pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'rm -r keras-flask-deploy-webapp'
                sh 'git clone https://github.com/KarluvKing/keras-flask-deploy-webapp.git'
                sh 'rm -r keras-flask-deploy-webapp'
                sh 'll'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

