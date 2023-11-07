pipeline {
    agent any

    environment {
        PATH = "${env.HOME}/.local/bin:/usr/local/bin:${env.PATH}"
    }

    stages {
        stage('Prepare') {
            steps {
                sh "curl -sSL https://install.python-poetry.org  | python3 - --version 1.5.1"
                sh "rm -rf dist package package.zip"
            }
        }
        stage('Test') {
            steps {
                sh 'poetry env remove 3.8 || true'
                sh 'poetry env use 3.8'
                sh 'poetry install --with dev'
	            sh 'poetry run coverage run --source=src -m pytest'
                sh 'poetry run coverage report --fail-under=41'
            }
        }
        stage('Build') {
            steps {
                sh 'rm -rf package package.zip'
                sh 'poetry env remove 3.8 || true'
                sh 'poetry env use 3.8'
                sh 'poetry install'
                sh 'poetry build'
                sh 'poetry run pip install --upgrade -t package dist/*.whl'
                sh 'cd src; zip -r ../package.zip lambda_function.py'
                sh "cd package; zip -r ../package.zip * -x 'boto3/*' -x 'botocore/*' -x '*.pyc' -x '*.dist-inf/*'"
                sh "zip -r package.zip src -x '*.pyc'"
            }
        }
        stage('Release') {
            steps {
                script {
                    env.VERSION = sh( script: 'git tag --contains ${GIT_COMMIT}', returnStdout: true).replace('v', '')
                }
                sh 'cosmos-release lambda --lambda-version=${VERSION} package.zip ${JOB_NAME}'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'cosmos deploy-lambda --force ${JOB_NAME} test'
            }
        }
    }
}