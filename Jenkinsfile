pipeline {
    agent any
    
    stages {
        stage('Setup') {
            steps {
                script {
                    try {
                        sh '''
                            pwd
                            ls -la
                            cat google.robot
                        '''
                    } catch (Exception e) {
                        error "Setup stage failed: ${e.message}"
                    }
                }
            }
        }
        
        stage('Install Dependencies') {
            steps {
                script {
                    try {
                        sh '''
                            pip3 install --no-cache-dir robotframework robotframework-seleniumlibrary
                            wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip
                            unzip /tmp/chromedriver.zip -d /usr/local/bin/
                            chmod +x /usr/local/bin/chromedriver
                        '''
                    } catch (Exception e) {
                        error "Dependencies installation failed: ${e.message}"
                    }
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    try {
                        sh 'robot google.robot'
                    } catch (Exception e) {
                        error "Robot tests failed: ${e.message}"
                    }
                }
            }
        }
    }
}