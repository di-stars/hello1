node {
    
    stage('Checkout'){
        checkout scm
    }
    
    stage ('Build app'){
        sh "go build"
    }

    stage ('Build container'){
        
        withCredentials([usernamePassword(credentialsId: 'hub_olymptrade', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh 'echo $PASSWORD'
            sh 'echo "$USERNAME'
        }
        
        sh "sudo docker build -t grizzly/hello1:latest ."
        sh "sudo docker tag grizzly/hello1:latest grizzly/hello1:v${env.BUILD_ID}"
    }

}
