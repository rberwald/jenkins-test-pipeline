pipeline {
    agent {
        kubernetes {
          yaml '''
            apiVersion: v1
            kind: Pod
            spec:
              containers:
              - name: kaniko
                image: gcr.io/kaniko-project/executor:debug
                command:
                - sleep
                args:
                - 10000000
                volumeMounts:
                  - name: kaniko-secret
                    mountPath: /kaniko/.docker
              restartPolicy: Never
              volumes:
                - name: kaniko-secret
                  secret:
                    secretName: saas-credentials
                    items:
                      - key: .dockerconfigjson
                        path: config.json
        '''
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
                    /kaniko/executor --context `pwd` --destination index.docker.io/rberwald/jenkins:0.1.0
                    '''
                }
            }
        }
    }
}