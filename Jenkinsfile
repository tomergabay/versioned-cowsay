pipeline {
  agent any
  environment {
      BRANCH = "realese/"
  }
  stages {
    stage ("Prompt for input") {
      steps {
        script {
          env.BRANCH += input message: 'Please enter version',
                             parameters: [string(defaultValue: '',
                                          description: '',
                                          name: 'version')]
        }
      }
    }
    stage ("check if branch exist") {
      steps {
        echo "${env.BRANCH}"
      }
    }
  }
}
