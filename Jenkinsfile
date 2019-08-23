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
        stage('Run docker container') {
            steps {
                sh 'docker build -t keras_flask_app /var/lib/jenkins/workspace/keras-flask-deploy-webapp_master/keras-flask-deploy-webapp/.'
                sh 'docker run -d -p 5000:5000 keras_flask_app'
            }
        }
        stage('Test if container is running') {
            steps {
                sh 'curl -Is http://localhost:5000'
                sh 'sleep 5'
            }
        }
        stage('Stop container - delete image') {
            steps {
                sh 'docker stop $(docker ps -a -q)'
                sh 'sleep 15'
                sh '''docker images -a | grep "keras_flask_app" | awk '{print $3}' | xargs docker rmi --force'''
                sh 'sleep 5'
            }
        }
        stage('Test aws connection') {
            steps {
                sh '/usr/bin/aws s3 ls'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

