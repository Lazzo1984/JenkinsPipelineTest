def folder = "${BRANCH_NAME}"
pipeline {
    agent any
        stages{
		stage('Create Folder') { 
			steps{
				script{    
					echo "Check se la Cartella ${folder} esiste----------------------"
					try{
					bat "rmdir /s /q   ${Directory}\\${folder}"
					} catch(err) {
					echo "---Se la Cartella ${folder} non esiste proseguo------------"
					echo err.getMessage()
					}
					echo "---Creazione della Cartella ---"
					bat "mkdir ${Directory}\\${folder}"
				}
			}
		}
		stage('Download branch from Git'){
			steps{
				script{
					dir("${Directory}\\${folder}") {
					echo "Download del branch selezionato da Git"
					git branch:'${BRANCH_NAME}',url:'https://github.com/Lazzo1984/JenkinsPipelineTest.git'
					echo "Fine Download da Git"
					}
				}		
			}	
		}
		stage('Richiamo Job Build'){
			steps{
				script{
					build job : 'Build',
					parameters:
						[[$class:'StringParameterValue',name:'directory',value:String.valueOf(directory)],
						[$class:'StringParameterValue',name:'BRANCH_NAME',value:String.valueOf(BRANCH_NAME)]]
                        		wait: true
					}
				}
			}
			
		}
		post{
			failure{
				mail to: 'stefano.lazzati1984@gmail.com',
				subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
				body: "Build Failed: ${env.BUILD_URL}"
				}
			success{
				script{
					if(currentBuild.result=='SUCCESS'){
					mail to: 'stefano.lazzati1984@gmail.com',
					subject: "Pipeline Success: ${currentBuild.fullDisplayName}",
					body: "Build Success: ${env.BUILD_URL}"
					}
				}
			}
		}
	}	
