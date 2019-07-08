#!/usr/bin/env sh

# Create SBT based project
# Usage: sh ./genesis.sh project-name

project_name=$1
mkdir $project_name
cd $project_name
mkdir -p src/{main,test}/{java,resources,scala}
mkdir lib project target

echo 'target/
project/target
lib_managed/
project/boot/
project/build/target/
project/plugins/target/
project/plugins/lib_managed/
project/plugins/src_managed/
.vscode
.idea
' > .gitignore

echo 'name := "TODO"

version := "1.0"

scalaVersion := "2.12.8"

libraryDependencies ++= Seq(
    "org.scalactic" %% "scalactic" % "3.0.4",
    "org.scalatest" %% "scalatest" % "3.0.4" % "test"
)' > build.sbt
find .
printf "\n=========== SEE THE GENERATED PROJECT STRUCTURE =============\n"
cat build.sbt
printf "\n=========== NOW CODE!!! =============\n"

sleep 3
echo "project structure generated ...."
echo "Now update the build.sbt file accordingly! "