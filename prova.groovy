def folder = "${BRANCH_NAME}"
pipeline {
    agent any
        stages{
        stage('Create Folder') { // for display purposes
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
}
}
   


