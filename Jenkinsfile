pipeline {
    agent any

    stages {
        stage('Test kubectl') {
            steps {
                sh '''curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.8/2019-08-14/bin/linux/amd64/kubectl'''
                sh '''chmod +x ./kubectl'''
                sh '''mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH'''
                sh ''''echo export PATH=$HOME/bin:$PATH' >> ~/.bashrc'''
                sh '''kubectl version --short --client'''
                sh '''aws --version'''
                sh '''aws eks --region us-west-2 update-kubeconfig --name prod'''
                sh '''kubectl get pod'''
            }
        }
        
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
                sh 'pwd'
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
                sh 'docker build -t capstone /var/lib/jenkins/workspace/keras-flask-deploy-webapp_master/keras-flask-deploy-webapp/.'
                sh 'docker run -d -p 5555:5555 capstone'
            }
        }
        stage('Test if container is running on port 5555') {
            steps {
                sh 'curl -Is http://localhost:8080 | head -1'
            }
        }
        stage('Stop container') {
            steps {
                sh 'docker stop $(docker ps -a -q)'
                sh 'sleep 10'
            }
        }
        stage('Push docker image to DockerHUB') {
            steps {
                sh 'echo "rui12345" | docker login --username=ruipbranco --password-stdin'
                sh '''docker tag $(docker images -a | grep "capstone" | awk '{print $3}') ruipbranco/capstonenddevops:firstversion'''
                sh 'docker push ruipbranco/capstonenddevops'
            }
        }
        stage('Deploy to AWS K8S') {
            steps {
                sh 'chmod 755 /var/lib/jenkins/workspace/keras-flask-deploy-webapp_master/keras-flask-deploy-webapp/run_k8s.sh'
                sh '/var/lib/jenkins/workspace/keras-flask-deploy-webapp_master/keras-flask-deploy-webapp/run_k8s.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Completed'
            }
        }
    }
}
