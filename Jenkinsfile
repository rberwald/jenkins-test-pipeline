def label = "podname.$BUILD_NUMBER-pipeline"
 
podTemplate(label: label, containers: [
 containerTemplate(name: 'kaniko', image: 'gcr.io/kaniko-project/executor:debug', command: '/busybox/cat', ttyEnabled: true)
],
volumes: [
  secretVolume(mountPath: '/kaniko/.docker/', secretName: 'saas-credentials')
]) {
 node(label) {
    stage('Stage 0: Checkout the code') {
        checkout scm
    }
    stage('Stage 1: Build with Kaniko') {  
      container('kaniko') {
        sh '''
          ls -l /kaniko/.docker
          cat /kaniko/.docker/config.json || true
          /kaniko/executor --context `pwd` --destination docker.io/rberwald/jenkins:lts-jdk11
        '''
      }
    }
  }
}