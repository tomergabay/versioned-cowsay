pipeline {
  agent any
  environment {
      ECR = "Fefd"
  }
  stages {
    stage ("Prompt for input") {
      steps {
        script {
          env.BRANCH = input message: 'Please enter version',
                             parameters: [string(defaultValue: '',
                                          description: '',
                                          name: 'version')]
          env.BRANCH = "realese/" + "${env.BRANCH}"
        }
      }
    }
    stage ("check if branch exist") {
      steps {
        sh "./if_exist.sh ${env.BRANCH}"
	      sh "{ echo 'tomer_gab';echo 'tomergab1342';} | ./newbranch.sh ${env.BRANCH}"
      }
    }
  } 
  post {
   always {
      sh 'docker rm -f /cowsay_test'
      cleanWs()
    }
  }

}
