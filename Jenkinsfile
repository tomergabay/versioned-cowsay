pipeline {
  agent any

  parameters {
    string defaultValue: '0', description: 'Release Version', name: 'version'
  }

  stages {
    stage('STAGE 1 check if branch exists') {
      steps {
        script {
          try {
            sh "git config --global user.email 'tomeriko01012001@gmail.com@gmail.com'"
            sh "git config --global user.name 'tomer gabay (EC2 JENKINS)'"

            sh "git checkout remotes/origin/release/${version}"
            sh "git checkout release/${version}"
            sh "git pull origin release/${version}"
            echo '~~~~~~~~~ BRANCH EXISTS - checkout & pull ~~~~~~~~~'
          } catch (Exception e) {
            sh 'git checkout main'
            sh "git checkout -b release/${version}"
            sh "echo ${version} > v.txt"
            sh "echo 'NOT FOR RELEASE' >> v.txt"
            sh "git commit -am 'Automated commit ${version}'"
            sh "git push origin release/${version}"
            echo '~~~~~~~~~ BRANCH NOT EXISTS - created branch & pushed ~~~~~~~~~'
          }
        }
      }
    }
    stage ('STAGE 2 ') {
      steps {
        echo 'stage 2'
      }
    }

  }

  post {
    always {
      cleanWs()
    }
  }
}
