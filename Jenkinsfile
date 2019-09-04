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
		stage('Test kubectl') {
			steps {
				sh './kubectl cluster-info dump'
			}
		}
	}
}

