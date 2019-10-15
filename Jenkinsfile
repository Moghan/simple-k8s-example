pipeline {
    agent {
        kubernetes {
            cloud "kubernetes"
            yamlFile "k8s/jenkins-agent-pod.yaml"
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