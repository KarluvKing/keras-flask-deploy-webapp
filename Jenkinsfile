pipeline {
    agent any

    stages {
        stage('Clean directory') {
            steps {
                sh 'ls -l'
                sh 'touch oneemptyfile'
                sh 'rm -r *'
                echo 'done'
            }
        }
        stage('Clone repository') {
            steps {
                sh 'git clone https://github.com/KarluvKing/keras-flask-deploy-webapp.git'
                sh 'ls -l'
            }
        }
        stage('Validate docker image') {
            steps {
                sh 'docker run --rm -i hadolint/hadolint hadolint --ignore DL3013 - < /var/lib/jenkins/workspace/keras-flask-deploy-webapp_master/keras-flask-deploy-webapp/Dockerfile'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

