pipeline {
    agent {label 'windows'}
    stages {
        stage('whoami') {
            steps {
                bat "whoami"
            }
        }
    }
}