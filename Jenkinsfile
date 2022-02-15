pipeline{
    agent none
    stages{
        stage('Git Clone'){
            steps{
                git branch: 'main', credentialsId: 'my_jenkins_repo_creden', url: 'https://github.com/Abdurrahman512/Jenkins.git'
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
