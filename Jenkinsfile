pipeline {
    agent any

    stages {
        stage('Clean directory') {
            steps {
                sh 'touch oneemptyfile'
                sh 'rm -r *.*'
                echo 'done'
            }
        }
        stage('Clone repository') {
            steps {
                sh 'git clone https://github.com/KarluvKing/keras-flask-deploy-webapp.git'
                sh 'ls -l'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

