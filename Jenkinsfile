pipeline {
    stages {
#        stage ('Clone') {
#            steps {
#                container('jnlp')  {
#                    git url: 'https://github.com/rberwald/jenkins-test-pipeline.git', branch: 'main'
#                }
#            }
#        }

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
