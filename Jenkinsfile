node {
	stage('Test kubectl') {
		withKubeConfig([credentialsId: 'TOKEN02', serverUrl: 'https://7A042B88C53ACF3CE443CD44955EF960.sk1.us-west-2.eks.amazonaws.com']) {
			sh 'kubectl cluster-info'
		} 
	}
}

