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
                sh 'DOCKER_BUILDKIT=0 docker build --no-cache -t sample-app:latest .'
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
                sh '''
                    sleep 3
                    IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sample-app-jenkins)
                    echo "IP del contenedor: $IP"
                    echo "Probando aplicación Flask..."
                    curl -f http://$IP:8888
                '''
            }
        }
    }
}
