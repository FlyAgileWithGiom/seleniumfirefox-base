pipeline {
    // agent any
    agent {
        dockerfile {
            args "-v /Users/guillaume/.jenkins/workspace/t:/home/jenkins/src/÷ -w /home/jenkins/src"
            reuseNode true
        }
    }
    // parameters {
    //         choice( name: 'feature', choices: ['full','login','products','account','register'])
    // }
    environment {
        // TESTS="${TESTS?:params.feature}"
        HOME='.'
        HEADLESS=1
    }
    stages {
        stage('Env variables'){
            steps {
                sh "env"
                sh "which -a geckodriver"
            }
        }
        // stage('Prep') {
        //     steps {
        //         dir('/home/jenkins/src') {
        //              stash includes: '/home/jenkins/src/node_modules', name: 'node_modules'  
        //         }
        //     }
        // }
        stage('Test') {
            steps {
                // dir('/home/jenkins/src') {
                    sh 'node --version'
                    sh 'pwd'
                    sh 'ls'
                    sh "ln -s /home/jenkins/src/node_modules ./"
                    sh "npm run wdio"
                    sh '[[ $(pwd) == /usr/src/ ]]'
                    // script {
                    //     if (! fileExists('node_modules') {
                    //         error "no node_modules"
                    //     }
                    // }
                    // sh '[[ -e node_modules]] && echo WORKED: node_modules || echo No node_modules'
                    

                // }
            }
        }
    }
}