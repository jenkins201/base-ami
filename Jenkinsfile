pipeline {
    agent {
        docker {
            image 'jenkins201/maven-packer:latest'
            args '-v /root/.m2:/root/.m2 --network jenkinscontainer_default'
        }
    }
    stages {
        stage('Validate') {
            steps {
                sh 'packer validate initial_ami.json'
            }
        }
        stage('Inspect') {
            steps {
                sh 'packer inspect initial_ami.json'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'mvn deploy'
            }
        }
    }
}
