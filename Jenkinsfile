pipeline{
    environment{
        registry = "diegomezg/docker-gradle"
        registryCredential= "dockerhub"
    }
    agent any
    stages{
        stage("Clone repository") {
        /* Cloning the Repository to our Workspace */
        checkout scm
    }
        stage("Build image") {
        /* This builds the actual image */
        dockerImage= docker.build registry
	    }       
    //     stage("Test"){
    //         steps{
    //             echo "========executing Test========"
    //         }
    //         post{
    //             always{
    //                 echo "========Test========"
    //                 sh "./gradlew clean test --no-daemon"
    //             }
    //             success{
    //                 echo "========Test executed successfully========"
    //             }
    //             failure{
    //                 echo "========Test execution failed========"
    //             }
    //         }
    //     }
    // }
    //     stage("Build"){
    //         post{
    //             always{
    //                 echo "========Build========"
    //                 sh "./gradlew build"
    //             }
    //             success{
    //                 echo "========pipeline executed successfully ========"
    //             }
    //             failure{
    //                 echo "========pipeline execution failed========"
    //             }
    //         }
    // }
        stage("Push image"){
            steps{
                script{
                    docker.withRegistry('',registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }
    }
}