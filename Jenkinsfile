pipeline {
    agent {
        kubernetes {
         }
    }
    stages {
        stage ('Build image') {
            steps {
                container('kaniko') {
                    sh '''
                        /kaniko/executor --context `pwd` --destination rberwald/jenkins:lts-jdk11
                    '''
                }
            }
        }

    }
}