pipeline{
    agent any
    stages{
        stage('Git Clone'){
            steps{
                git branch: 'Jenkin_docker', url: 'https://github.com/Abdurrahman512/Jenkins.git'
            }
        }
        stage('Maven Build'){
            steps{
                sh 'mvn package'
            }
        }
        stage('Create Docker image'){
            steps{
                sh 'mkdir dockerimg'
                sh 'cd dockerimg'
                sh 'cp /var/lib/jenkins/workspace/class_pipeline/target/maigolab_hello-1.0.0.jar  .'    
                sh 'docker build -t webimage:$BUILD_NUMBER .'
                sh 'sudo docker  run -itd --name webserver$BUILD_NUMBER -p 8081 webimage:$BUILD_NUMBER'
            }
        }
    }
}
