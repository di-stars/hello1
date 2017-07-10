node {
    
    def MICRO_NAME = "hello1"
    def MICRO_PORT_PROD = "8081"
    
    stage('Checkout'){
        checkout scm
    }
    
    stage ('Generate Dockerfile'){
        writeFile file: "Dockerfile", text: "FROM golang:latest"
        writeFile file: "Dockerfile", text: "RUN mkdir /app"
        writeFile file: "Dockerfile", text: "COPY ${WORKSPACE}/${MICRO_NAME} /app/${MICRO_NAME}"
        writeFile file: "Dockerfile", text: "CMD ["/app/${MICRO_NAME}"]"
        writeFile file: "Dockerfile", text: "EXPOSE ${MICRO_PORT_PROD}"
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
