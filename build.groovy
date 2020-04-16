pipeline {
   agent any
		parameters {
        string(defaultValue: "", name: 'Directory');
        string(defaultValue: "", name: 'BRANCH_NAME')
        }
        stages {
            stage('Build'){
                steps{
                   script{
			echo "${Directory}"
                        echo "${BRANCH_NAME}"
                        dir("${Directory}\\${BRANCH_NAME}"){
                        echo "inizio della build..."
			mvn deploy -Dmaven.test.skip=true -DaltDeploymentRepository=nexus::default::http://localhost:8081/repository/maven-releases/
                        echo "Fine della build"
                       }
                        
					}
				}
			}
		}
}
