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
        stage('Validate python code') {
            steps {
                sh 'pylint --disable=R,C,W1203,E0401,W0621,W0611 /var/lib/jenkins/workspace/keras-flask-deploy-webapp_master/keras-flask-deploy-webapp/app.py'
            }
        }
        stage('Validate docker image') {
            steps {
                sh 'docker run --rm -i hadolint/hadolint hadolint --ignore DL3013 - < /var/lib/jenkins/workspace/keras-flask-deploy-webapp_master/keras-flask-deploy-webapp/Dockerfile'
            }
        }
        stage('Test aws connection') {
            steps {
                sh 'aws s3 ls'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

