pipeline {
    agent any

    stages {
        stage('Git clone repo') {
            steps {
                echo 'clone repo'
                git clone 'https://github.com/KarluvKing/keras-flask-deploy-webapp.git'
                echo 'finish...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}


