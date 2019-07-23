node {

    stage('init'){
        def dockerHome = tool 'docker'
        def mavenHome  = tool 'maven'
        env.PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
    }

    stage('checkout'){
        git 'https://github.com/mustafaguven/koc-assesment'
    }

    stage('clean compile package'){
        sh "mvn clean compile package"
    }

    stage('sonarqube analysis') {
        withSonarQubeEnv('sonar') {
          sh "mvn sonar:sonar"
        }
    }

    stage('docker build') {
       sh "docker build -f Dockerfile -t hello-world ."
    }

    stage('docker image push to hub') {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'docker_user_name', passwordVariable: 'docker_user_pass')]){
            sh "docker login -u  $docker_user_name -p  $docker_user_pass"
            sh "docker tag hello-world:latest $docker_user_name/hello-world:latest"
            sh "docker push $docker_user_name/hello-world"
        }
    }

    stage('remove docker image from jenkins machine') {
        sh "docker rmi hello-world -f"
    }

    stage('PSEUDO connect qa via ssh and remove docker image which is running'){
        sh "echo 'docker rmi mustafaguven/hello-world -f && echo old image is removed || echo none image found to be removed'"
    }

    stage('PSEUDO connect qa via ssh and run latest docker'){
        sh "echo 'ssh -tt -l devops ec2-user@10.10.10.10 docker run -d -p 10000:10000 --name hello-world mustafaguven/hello-world"
    }

}
