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
        stage('Install Dependencies') {
            steps {
                sh '''
                    pip3 install --no-cache-dir robotframework robotframework-seleniumlibrary
                    # ติดตั้ง ChromeDriver
                    wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip
                    unzip /tmp/chromedriver.zip -d /usr/local/bin/
                    chmod +x /usr/local/bin/chromedriver
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