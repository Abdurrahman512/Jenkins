pipeline{
    agent Any
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
                sh 'docker biuld -t webimage:$BUILD_NUMBER .'
            }
        }
    }
}
