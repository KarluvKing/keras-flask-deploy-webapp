pipeline {
    agent any

    stages {
        stage('Check docker file...') {
            steps {
                docker run --rm -i hadolint/hadolint < Dockerfile
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


