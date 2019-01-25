#!/bin/bash
# Selezione Maven da utilizzare nella build
# copia il progetto eclipse con le modifiche in una struttura maven 
echo "Copia il progetto da Eclipse a Portale della Sicurezza"
# 
cp /root/Desktop/project2/src/com/dev/project2/* /root/Desktop/PortaleSicurezza/war/src/main/java/com/dev/project2
cp -r /root/Desktop/project2/WebContent/* /root/Desktop/PortaleSicurezza/WebContent/
# compilazione secca
echo "Vuoi buildare il progetto?(y/n)"
read buildyes
if [ "$buildyes" = "y" ];
then
mvn clean install
fi
# sonar di produzione secca
echo "Vuoi effettuare il sonar del progetto?(y/n)"
read sonaryes
if [ "$sonaryes" = "y" ];
then
mvn sonar:sonar
fi
# deploy in produzione
echo "Vuoi deployare il progetto in produzione?(y/n) password cmgroup13"
read deployyes
if [ "$deployyes" = "y" ];
then
scp /root/Desktop/PortaleSicurezza/war/target/project2.war cmgroup@10.221.208.138:/home/cmgroup/apache-tomcat-7.0.39-project2/webapps
fi
