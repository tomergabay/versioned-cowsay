pipeline {
  agent any
  environment {
      BRANCH = ""
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
        echo "${env.BRANCH}"
      }
    }
  }
}
