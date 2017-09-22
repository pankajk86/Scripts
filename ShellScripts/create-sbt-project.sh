#!/bin/sh
echo "==================Sbt project setup with eclipse plugin=================="
echo "Let's create an sbt project with sbt-eclipse plugin."
echo "Once finished, you can import this project in Scala IDE, for development."
echo "========================================================================="

read -p "Please enter project location at ~/Desktop: " project_location
read -p "Please enter the new Project name: " new_project

scala -version

# move to the project location
cd ~/Desktop/${project_location}

# create and move to the new project directory
mkdir ${new_project}
echo "${new_project} project folder created..."
cd ${new_project}

# create source folders
mkdir -p src/main/scala 	# this is for unix based systems, like Mac OS, or Linux
echo "src/main/scala source folder created..."
mkdir -p src/main/java
echo "src/main/java source folder created..."

# create a sample scala class file
echo 'object HelloWorld { def main(args: Array[String]) = println("Hello World!") }' > src/main/scala/App.scala

# create build.sbt file
printf "%s\n" "name := \"${new_project}\"" "version := \"1.0\"" "scalaVersion := \"2.11.8\"" >> ./build.sbt
echo "build.sbt created"

# setup project directories
echo "Now running project set up for eclipse"
sbt run
sbt eclipse

echo "Project setup is complete. It may be imported in Scala IDE now!!!"
