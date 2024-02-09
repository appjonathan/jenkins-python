pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/appjonathan/jenkins-python']]
                ])
            }
        }
        stage('Stage 2') {
            steps {
                sh 'python3 main.py'
            }
        }
        stage('Test-Stage') {
            steps {
                sh 'python3 test.py'
            }
        }
        stage('Static Code Analysis') {
            steps {
                sh 'pylint main.py || true'
                sh 'pylint --exit-zero --reports=n --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" *.py > pylint-report.txt'
                sh 'cat pylint-report.txt'
            }
        }
        stage('Check Dockerfile') {
            steps {
                sh 'ls -l'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-python-app .'
            }
        }
    }
}