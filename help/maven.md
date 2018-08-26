#### Generate
  * mvn archetype:generate -DgroupId=org.whatever.commons -DartifactId=whatever-commons-utils -DarchetypeArtifactId=maven-archetype-quickstart -Dpackage=org.whatever.commons.utils

#### Build
  1. cd whatever-commons-utils
  2. mvn package

#### Run

1. mvn dependency:copy-dependencies -DincludeScope=runtime
2. java -cp target/*:target/dependency/* org.whatever.commons.utils.App
OR
1. mvn compile
2. mvn exec:exec -Dexec.executable="java" -Dexec.args="-cp %classpath org.whatever.commons.utils.App"

#### Remove local dependencies
1. mvn dependency:purge-local-repository -DreResolve=false

#### Update dependencies

  1. Check for version updates to your dependencies, and then update the outdated dependencies in your pom.xml file as necessary.
  mvn versions:display-dependency-updates

  2. Get a list of your repositories, and make sure they’re pointing to all the correct dependencies.
  mvn dependency:list-repositories

  3. Get a list of your plugin and project dependencies, and make sure they’re all available in your private or local repository
  mvn dependency:go-offline
