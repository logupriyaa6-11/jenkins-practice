pipeline {
    agent any
    stages {
        stage ('Deploy') {
            steps {
                sh 'sudo cp -r * /var/www/html/'
            }
        }
    }
}