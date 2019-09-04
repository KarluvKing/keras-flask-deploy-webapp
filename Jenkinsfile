node {
	stage('Test kubectl') {
		withKubeConfig([credentialsId: 'user1', serverUrl: '']) {
			sh 'kubectl cluster-info'
		} 
	}
}

