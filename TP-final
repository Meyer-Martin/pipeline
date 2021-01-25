pipeline {
    agent { dockerfile true }
    stages {
        stage('Launch') {
            steps {
                sh 'python /srv/test/test.py'
            }
        }
        stage('Echo') {
            steps {
                sh 'whoami'
            }
        }
    }
}
