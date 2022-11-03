pipeline {
  agent any
  stages {
    stage ("Prompt for input") {
      steps {
        script {
          env.USERNAME = input message: 'Please enter the username',
                             parameters: [string(defaultValue: '',
                                          description: '',
                                          name: 'Username')]
        }
        echo "Username: ${env.USERNAME}"
      }
    }
  }
}