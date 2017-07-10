node {
    
    stage('Checkout') {
        checkout scm
    }
    
    stage ('Build app')
        sh 'go build'

     stage ('Build container') {
      steps {
        sh "docker build -t grizzly/hello1:latest ."
      }
    }
}
