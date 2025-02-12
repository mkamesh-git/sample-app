pipeline {
    agent any

    environment {
        IMAGE_NAME = 'kamesh319/nginx'  // Docker Hub image name
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
                sh 'docker build -t ${IMAGE_NAME} .'  // Build image
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: DOCKER_CREDENTIALS, url: 'https://index.docker.io/v1/']) {
                        echo '✅ Logged into Docker Hub'
                        sh 'docker push ${IMAGE_NAME}'  // Push image inside authentication block
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Successfully pushed ${IMAGE_NAME} to Docker Hub!"
        }
        failure {
            echo "❌ Build or Push failed! Check logs."
        }
    }
}
