pipeline {
  agent {
    docker { image 'jenkins/jenkins:lts-jdk11' }
  }
  stages {
    stage('Test') {
      steps {
        sh 'jenkins-plugin-cli --list'
      }
    }
  }
}
