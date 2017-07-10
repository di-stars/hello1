node {
    
    def MICRO_NAME = "hello1"
    
    stage('Checkout'){
        checkout scm
    }
    
    stage ('Build app'){
        sh "go build -o ${MICRO_NAME}"
    }
    
    stage ('Build container'){
               
        withCredentials([usernamePassword(credentialsId: 'hub_olymptrade', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "sudo docker login hub.olymptrade.com --username=$USERNAME --password=$PASSWORD"            
        }
        
        sh "sudo docker build -t grizzly/${MICRO_NAME}:${BRANCH_NAME} ."        
        sh "sudo docker tag grizzly/${MICRO_NAME}:${BRANCH_NAME} hub.olymptrade.com/grizzly/${MICRO_NAME}:${BRANCH_NAME}"
        sh "sudo docker push hub.olymptrade.com/grizzly/${MICRO_NAME}:${BRANCH_NAME}"
    }

}
