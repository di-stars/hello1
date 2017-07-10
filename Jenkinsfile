node {
    
    stage('Checkout'){
        checkout scm
    }
    
    stage ('Build app'){
        sh "go build"
    }

    stage ('Build container'){
        
        echo "$JOB_NAME"
        echo "$WORKSPACE"
        echo "$PROJECTNAME"
        
        withCredentials([usernamePassword(credentialsId: 'hub_olymptrade', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "sudo docker login hub.olymptrade.com --username=$USERNAME --password=$PASSWORD"            
        }
        
        sh "sudo docker build -t grizzly/hello1:$BRANCH_NAME ."        
        sh "sudo docker tag grizzly/hello1:$BRANCH_NAME hub.olymptrade.com/grizzly/hello1:$BRANCH_NAME"
        sh "sudo docker push hub.olymptrade.com/grizzly/hello1:$BRANCH_NAME"
    }

}
