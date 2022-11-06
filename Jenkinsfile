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
            sh "git config --global user.email 'tomeriko01012001@gmail.com'"
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
    stage ('STAGE 2 find latest tag') {
      steps {
        sh 'git fetch --tags'

        script {
          try {
            // new_tag = Integer.parseInt( sh(script: "git tag | grep ${version} | sort --version-sort | tail -1 | cut -d '.' -f 3", returnStdout: true).trim() )
            new_tag = Integer.parseInt(sh(script: "git tag | grep ${version} | sort --version-sort | tail -1 | cut -d '.' -f 3", returnStdout: true).trim())
            echo "${new_tag}"
            new_tag += 1
          } catch (Exception e) {
            new_tag = 0
          }
          new_version = "${version}.${new_tag}"
        }
      }
    }

    stage ('STAGE 3 build & run') {
      steps {
        sh "docker build -t ron_cowsay:${new_version} ."
        sh "docker run --name app --network project_lab_net -p 4001:8080 -d ron_cowsay:${new_version}"
      }
    }

    stage ('STAGE 4 Tests') {
      steps {
         sh 'sleep 20'
	 sh 'curl app:8080'
      }
    }

    // stage ('STAGE 5 Release (push to ECR)') {

    // }
  }

  post {
    always {
      sh 'docker rm -f app'
      cleanWs()
    }
  }
}
