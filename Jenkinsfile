pipeline {
  agent any
  tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
    }
  stages {
    stage('build') {
     steps {
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
                docker build . -t my-maven-spring-petclinic:3.40
                docker login
                docker push my-maven-spring-petclinic:3.40
             
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
    }
    

  }
}
