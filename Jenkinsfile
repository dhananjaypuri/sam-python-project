pipeline {
    agent any;
        environment {
        AWS_ACCESS_KEY_ID = ''
        AWS_SECRET_ACCESS_KEY = ''
        AWS_REGION = 'ap-south-1'
        SAM_CLI_TELEMETRY=0
        SAM_CLI_POLL_METRICS=0
    }
    stages {
                stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Test') {
                agent {
        docker { image 'dhananjaypuri/samcli_x86' }
    }
            steps {
                sh '''
                rm -rf *
                git clone https://github.com/dhananjaypuri/sam-python-project.git
                cd sam-python-project && mkdir -p layer/python
                ls -al
                bash ./deploy.sh
                '''
            }
        }
    }
        post {
        always {
            cleanWs()
        }
    }
}
