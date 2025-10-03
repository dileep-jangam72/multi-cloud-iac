pipeline {
    agent any

    environment {
        TF_VERSION = "1.5.0"
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        ARM_CLIENT_ID         = credentials('azure-client-id')
        ARM_CLIENT_SECRET     = credentials('azure-client-secret')
        ARM_SUBSCRIPTION_ID   = credentials('azure-subscription-id')
        ARM_TENANT_ID         = credentials('azure-tenant-id')
        GOOGLE_CLOUD_KEYFILE_JSON = credentials('gcp-service-account')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                  terraform -chdir=envs/aws init -backend=false
                  terraform -chdir=envs/azure init -backend=false
                  terraform -chdir=envs/gcp init -backend=false
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                  terraform -chdir=envs/aws validate
                  terraform -chdir=envs/azure validate
                  terraform -chdir=envs/gcp validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                  terraform -chdir=envs/aws plan -out=aws.tfplan
                  terraform -chdir=envs/azure plan -out=azure.tfplan
                  terraform -chdir=envs/gcp plan -out=gcp.tfplan
                '''
            }
        }

        stage('Approval') {
            steps {
                input message: "Approve to Apply Terraform?", ok: "Deploy"
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                  terraform -chdir=envs/aws apply -auto-approve aws.tfplan
                  terraform -chdir=envs/azure apply -auto-approve azure.tfplan
                  terraform -chdir=envs/gcp apply -auto-approve gcp.tfplan
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/*.tfplan', fingerprint: true
        }
    }
}
