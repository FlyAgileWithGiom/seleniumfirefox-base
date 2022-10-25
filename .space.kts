/**
* JetBrains Space Automation
* This Kotlin-script file lets you automate build activities
* For more info, see https://www.jetbrains.com/help/space/automation.html
*/

job("create image!") {
    job("Build image") {duquesnay/wdiobase:build-test
        CONTAINER_NAME="duquesnay/wdiobase:build-test"
        docker {
            build {
                context = "docker"
                file = "./Dockerfile"
                name = "duquesnay/wdiobase:build-test"
                labels["vendor"] = "fly-agile"
                args["HTTP_PROXY"] = "http://10.20.30.1:123"
            }
        }
        container(displayName = "wdio fresh build", 
                  image = "duquesnay/wdiobase:build-test",
                 init = {
                     mountDir="/usr/src"
                 }) {    
            shellScript {
                content = """
                    cd test/
                    npm install & npm run wdio-headless
                """
            }
        }
    }
}
