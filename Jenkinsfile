pipeline {
    agent {
        kubernetes {
            cloud "kubernetes"
            yamlFile "k8s/ci/jenkins-agent-pod.yaml"
        }
    }
    environment {
        APP_NAME = "simple-k8s-example"
    }
    stages {
        stage('Continues Integration (TEST)') {
            steps {
                checkout scm
                sh 'ls'
            }
        }
        stage('Docker test') {
            steps {
                container('docker') {
                    withCredentials([usernamePassword(credentialsId: 'docker-user-y', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                        sh '''
                            docker build . -t ybsnek/simple-k8s-example:latest
                            docker push ybsnek/simple-k8s-example:latest
                        '''
                    }
                    sh "docker version"
                }
            }
        }
        stage('Node test') {
            steps {
                container('node') {
                    sh "npm version"
                }
            }
        }
        
    }
}