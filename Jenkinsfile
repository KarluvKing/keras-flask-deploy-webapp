pipeline {
    agent any

    stages {
        stage('Check docker file...') {
            steps {
                sudo docker run --rm -i hadolint/hadolint < Dockerfile
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


