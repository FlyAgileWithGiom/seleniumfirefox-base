docker run -d --name jenkins_test  --env JENKINS_ADMIN_ID=giom --env JENKINS_ADMIN_PASSWORD=giom -p 8083:8080 -p 50003:50000 --restart=on-failure -v /Users/guillaume/dev/lo/shopify_testing/tmp_dockerfile:/mnt/project -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home_test:/var/jenkins_home fly-agile/jenkins:latest

