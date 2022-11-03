pipeline {
  agent any
  stages {
    stage ("Prompt for input") {
      steps {
        script {
          env.USERNAME = input message: 'Please enter version',
                             parameters: [string(defaultValue: '',
                                          description: '',
                                          name: 'version')]
        }
      }
    }
    stage ("check if branch exist") {
      steps {
        sh './if_exist.sh RELEASE\${env.USERNAME}'
      }
  }
}
