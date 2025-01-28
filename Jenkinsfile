pipeline {
    agent any
    stages {
        stage('Setup') {
            steps {
                sh '''
                    pwd
                    ls -la
                    cat google.robot
                '''
            }
        }
        stage('Test') {
            steps {
                sh 'robot google.robot'
            }
        }
    }
}