pipeline {
    agent any
    stages {
        stage ('Deploy') {
            steps {
                sh 'cp -r * /var/www/html/'
            }
        }
    }
}
