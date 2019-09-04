pipeline {
	agent any
	stages {
		stage('Clone repository') {
			steps {
				sh 'touch oneemptyfile'
				sh 'rm -r *'
				echo 'done'
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
				sh 'curl -Is http://localhost:5555 | head -1'
				sh 'docker stop $(docker ps -a -q)'
			}	
		}
		stage('Push docker image to DockerHUB') {
			steps {
				sh 'echo "rui12345" | docker login --username=ruipbranco --password-stdin'
				sh 'docker tag $(docker images -a | grep "capstone" | awk \'{print $3}\') ruipbranco/capstonenddevops:firstversion'
				sh 'docker push ruipbranco/capstonenddevops'
			}
		}
		stage('Deploy to AWS K8S') {
			steps {
				sh '/var/lib/jenkins/kubectl run --image=ruipbranco/capstonenddevops capstone-app --port=5555'
				sh '/var/lib/jenkins/kubectl expose deployment capstone-app --port=5555 --name=capstone-http' 
			}
		}
    }
}
