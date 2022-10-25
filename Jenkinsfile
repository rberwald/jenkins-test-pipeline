pipeline {
    agent {
        kubernetes {
          yaml '''
            apiVersion: v1
            kind: Pod
            spec:
              containers:
              - name: jnlp
                resources:
                  requests:
                    cpu: 512m
                    memory: 4G
                  limits:
                    cpu: 512m
                    memory: 4G
              - name: kaniko
                image: gcr.io/kaniko-project/executor:debug
                command:
                - sleep
                args:
                - 10000000
                resources:
                  requests:
                    cpu: 1500m
                    memory: 12G
                  limits:
                    cpu: 1500m
                    memory: 12G
                volumeMounts:
                  - name: dockerhubcreds
                    mountPath: /kaniko/.docker
              restartPolicy: Never
              volumes:
                - name: dockerhubcreds
                  secret:
                    secretName: dockerhubcreds
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
                    /kaniko/executor --cache=true --cache-copy-layers=true --cache-ttl=96h --context `pwd` --destination index.docker.io/rberwald/jenkins:0.1.0
                    '''
                }
            }
        }
    }
}