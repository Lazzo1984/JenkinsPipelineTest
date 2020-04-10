pipeline {
   agent any
		parameters {
        string(defaultValue: "", name: 'directory');
        string(defaultValue: "", name: 'BRANCH_NAME')
        }
        stages {
            stage('Build'){
                steps{
                   script{
						echo "${directory}"
                        echo "${BRANCH_NAME}"
                        dir("${directory}\\${BRANCH_NAME}"){
                        echo "inizio della build..."
                        echo "Fine della build"
                       }
                        
					}
				}
			}
		}
}
