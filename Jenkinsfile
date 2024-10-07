pipeline {
    agent any
    
    tools {
        maven 'maven'
    }
    
    stages {
        stage('Prepare Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t achuth .'
                    sh 'docker tag achuth achuthmpalankar/mytask:$BUILD_ID'
                    sh 'docker tag achuth achuthmpalankar/mytask:latest'
                }
            }
        }
        
        stage('Docker Login') {
    steps {
        script {
            withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin"
            }
        }
    }
}

        
        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker push achuthmpalankar/mytask:$BUILD_ID'
                    sh 'docker push achuthmpalankar/mytask:latest'
                    sh 'docker rmi -f achuthmpalankar/mytask:$BUILD_ID'
                    sh 'docker rmi -f achuthmpalankar/mytask:latest'
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker rm -f mytask'
                    sh 'docker run -it -d --name mytask -p 1234:1234 achuthmpalankar/mytask:latest'
                }
            }
        }
   }
}
