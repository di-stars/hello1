node {
    
    stage('Checkout'){
        checkout scm
    }
    
    stage ('Build app'){
        sh "go build"
    }

    stage ('Build container'){
        
        withCredentials([usernamePassword(credentialsId: 'hub_olymptrade', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "sudo docker login hub.olymptrade.com --username=$USERNAME --password=$PASSWORD"            
        }
        
        sh "sudo docker build -t grizzly/hello1:latest ."        
        sh "sudo docker tag grizzly/hello1:latest hub.olymptrade.com/grizzly/hello1:latest"
        sh "sudo docker push hub.olymptrade.com/grizzly/hello1:latest"
    }

}
