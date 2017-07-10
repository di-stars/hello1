node {
    
    stage('Checkout'){
        checkout scm
    }
    
    stage ('Build app'){
        sh "go build"
    }

    stage ('Build container'){
        sh "sudo docker build -t grizzly/hello1:latest ."
        sh "sudo docker tag grizzly/hello1:latest grizzly/hello1:v${env.BUILD_ID}"
    }

}
