pipeline{
    agent any
    stages{
        stage("Test"){
            steps{
                echo "========executing Test========"
            }
            post{
                always{
                    echo "========Test========"
                    sh "./gradlew clean test --no-daemon"
                }
                success{
                    echo "========Test executed successfully========"
                }
                failure{
                    echo "========Test execution failed========"
                }
            }
        }
    }
    post{
        always{
            echo "========Build========"
            sh "./gradlew build"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}