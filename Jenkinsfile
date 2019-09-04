node {
	stage('Test kubectl') {
		withKubeConfig([credentialsId: 'iam-root-account@eksworkshop-eksctl.us-west-2.eksctl.io', serverUrl: 'https://7A042B88C53ACF3CE443CD44955EF960.sk1.us-west-2.eks.amazonaws.com']) {
			sh 'kubectl cluster-info'
		} 
	}
}

