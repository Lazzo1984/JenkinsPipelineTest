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
                        echo "Fine della build"
                       }
                        
					}
				}
			}
		}
}
