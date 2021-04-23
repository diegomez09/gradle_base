pipeline{
    environment{
        registry = "diegomezg/gradle-docker"
        dockerHubAccess = 'DOCKER_CREDENTIALS'
    }
    agent any
    stages{
        stage('Clone repository'){
            steps{
                echo '=============== Cloning repository ==============='
                checkout scm
            }
        }
        stage('Build image'){
            steps{
                script{
                    echo '================= Building image ================='
                    dockerImage = docker.build registry + ":$BUILD_ID"
                }
            }
        }
        stage('Deploy image'){
            steps{
                script{
                    echo '================= Deplying image ================='
                    docker.withRegistry('', dockerHubAccess) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}