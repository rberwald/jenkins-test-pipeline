pipeline {
    agent {
        kubernetes {
          yaml '''
            apiVersion: v1
            kind: Pod
            spec:
              containers:
              - name: maven
                image: maven:3.8.1-jdk-8
                command:
                - sleep
                args:
                - 9999999
              - name: kaniko
                image: gcr.io/kaniko-project/executor:debug
                command:
                - sleep
                args:
                - 9999999
              restartPolicy: Never
        '''
        }
    }

    stages {
        stage ('Clone') {
            steps {
                container('maven')  {
                    git url: 'https://github.com/rberwald/jenkins-test-pipeline.git', branch: 'main'
                }
            }
        }


        stage ('Exec Kaniko') {
            steps {
                container('kaniko') {
                    sh '''
                        cat /kaniko/.docker/config.json
                        /kaniko/executor --context `pwd` --destination rberwald/inboud-agent:0.1.0
                    '''
                }
            }
        }

    }
}
