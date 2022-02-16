pipeline{
    agent none
    stages{
        stage('Git Clone'){
            agent any
            steps{
                git branch: 'main', url: 'https://github.com/Abdurrahman512/Jenkins.git'
            }
        }
        stage('Maven Compile'){
            agent any
            steps{
                sh 'mvn compile'
            }
        }
        stage('Maven Test'){
            agent any
            steps{
                sh 'mvn test'
            }
        }
        stage('Maven Build'){
            agent any
            steps{
                sh 'mvn package'
            }
        }
        stage('Maven Deploy'){
            agent any
            steps{
                sh label: '', script: '''rm -rf dockerimg
mkdir dockerimg
cd dockerimg
cp /var/lib/jenkins/workspace/class__Jenkinsfile_Dockerfile/target/maigolab_hello-1.0.0.jar  .
touch Dockerfile
cat <<EOT>>Dockerfile
FROM tomcat:8.0-alpine
ADD maigolab_hello-1.0.0.jar /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]

EXPOSE 8080
EOT
sudo docker build -t webimage:$BUILD_NUMBER .
sudo docker  run -itd --name webserver$BUILD_NUMBER -p 8081 webimage:$BUILD_NUMBER'''
            }
        }
    }
}
