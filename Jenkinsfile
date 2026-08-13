pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker') {
            steps {
                sh 'docker build -t sample-app:latest .'
            }
        }

        stage('Run Docker') {
            steps {
                sh 'docker rm -f sample-app-jenkins || true'
                sh 'docker run -d --name sample-app-jenkins -p 8888:8888 sample-app:latest'
            }
        }

        stage('Test') {
            steps {
                sh 'sleep 3'
                sh 'curl -f http://localhost:8888'
            }
        }
    }
}
