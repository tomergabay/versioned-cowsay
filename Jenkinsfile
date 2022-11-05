pipeline {
  agent any
  parameters {
    string defaultValue: '0', description: 'Release version', name: 'version'
  }

  stages {

    stage ("STAGE 1 check if branch exist") {
      steps {
        script {
         try {
           sh "git checkout remotes/origin/release/${version}"
           sh "git checkout -b release/${version}"
	   sh "git pull origin release/${version}"
         } catch {Exception e} {
           sh "git checkout main"
           sh "git checkout -b release/${version}"
           sh "echo ${version} > v.txt"
           sh "echo "NOT FOR RELEASE" >> v.txt"
           sh "git commit -am 'Auatomatic commit ${version}'"
           sh "git push origin release/${version}"

         }
        }
      }
    }
    stage ("STAGE 2 pull resources")
      steps {
        echo "finealright"
      }
  }
}
