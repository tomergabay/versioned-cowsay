pipeline {
    agent any

    parameters {
        string defaultValue: '0' , description: 'Release version' , name: 'version'
    }
    stages {

        stage ('something') {
            steps {
                script {
                    try {
                        sh "git checkout remotes/origin/release/${version}"
                        sh "git checkout -b release/${version}"
                        sh "git config --global user.email 'Levmeshorer16@gmail.com'"
                        sh "git config --global user.name 'Lev - Jenkins container' "
                        echo "HERE"
                    }   
                    catch (Exception e) {
                        sh "git checkout master"
                        sh "git checkout -b release/${version}"
                        sh "echo ${version} > v.txt"
                        sh "echo NOT FOR RELEASE >> v.txt"
                        sh "git commit -am 'Automated commit' ${version}"
                        sh "git push origin release/${version}"

                    }
                }

            }
        }
    }
}