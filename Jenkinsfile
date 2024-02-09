pipeline {
    agent any

    stages {
        stage('Stage 1') {
            steps {
                git branch: 'main', url:'https://github.com/RaupeCHR/jenkins-python.git'
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
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-python-app .'
            }
        }
    }
}