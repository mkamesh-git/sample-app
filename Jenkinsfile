pipeline {
    agent any

    environment {
        IMAGE_NAME = 'kamesh319/nginx'  // Your Docker Hub image name
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // Jenkins credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mkamesh-git/sample-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'  // Build image with 'kamesh319/nginx'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS, url: 'https://index.docker.io/v1/']) {
                    echo 'Logged into Docker Hub'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME'  // Push image to Docker Hub
            }
        }
    }

    post {
        success {
            echo "✅ Successfully pushed $IMAGE_NAME to Docker Hub!"
        }
        failure {
            echo "❌ Build or Push failed! Check logs."
        }
    }
}
