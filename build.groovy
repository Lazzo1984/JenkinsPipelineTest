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
			def mvnHome = tool 'M3'
			bat "${mvnHome}\\bin\\mvn clean package"
                        echo "Fine della build"
                       }
                        
					}
				}
			}
		}
}
