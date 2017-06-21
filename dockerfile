#THIS DOCKER FILE IS DEVELOPED BY ASSISTANZ NETWORKS

#SPECIFY THE CONTAINER IMAGE
FROM microsoft/windowsservercore

#COPY THE JENKINS INSTALLATION FILES INTO THE CONTAINER
ADD ./setup c:/jenkins

#INSTALLING IIS
RUN Powershell.exe -Command Install-WindowsFeature Web-Server

#INSTALLING JENKINS
RUN ["msiexec.exe", "/i", "C:\\jenkins\\jenkins.msi", "/qn"]

#REMOVING SETUP FILES FROM CONTAINER
RUN Powershell.exe -Command remove-item c:/jenkins -Recurse