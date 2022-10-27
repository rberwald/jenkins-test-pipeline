pipeline {
    agent {
        kubernetes {
          defaultContainer 'jnlp'
          yaml libraryResource('podTemplates/kaniko.yaml')
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
              sh '''
                  echo 'Build my application around here'
              '''
            }
        }

        stage('Package') {
            steps {
                container('kaniko') {
                    sh '''
                      /kaniko/executor --context `pwd` --destination index.docker.io/rberwald/jenkins:lts-jdk11
                    '''
                }
            }
        }
    }
}
