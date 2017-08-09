function create_sbt_skeleton_project 
{
    # Initial project version for the sbt project to be created.
    INITIAL_PROJECT_VERSION=0.1

    # Scala version retrieved from scalac -version command
    SCALA_VERSION=`scalac -version 2>&1 |cut -d' ' -f4 -s`

   # Creates build.sbt file and populates it.
    create_and_populate_build_file $INITIAL_PROJECT_VERSION $SCALA_VERSION

   # Creates the directory tree for all src code 
    create_src_directory_tree

}

 # Creates build.sbt file and populates it.
 # Arguments:
 #  $arg1 -> Initial project version
 #  $arg2 -> Scala version
function create_and_populate_build_file {
    # File containing all build information for an sbt project
    touch build.sbt
   
    # Project version
    echo "/** Current project version **/" >> build.sbt
    echo "version := \"""$1""\"" >> build.sbt
    echo "" >> build.sbt

    # Scala version
    echo "/** Current Scala version installed in this system **/" >> build.sbt
    echo "scalaVersion := \"""$2""\"" >> build.sbt
    echo "" >> build.sbt

    # Resolvers
    echo "/** Resolvers are alternative repositories from where libraries can be retrieved **/" >> build.sbt
    echo "resolvers ++= Seq()" >> build.sbt
    echo "" >> build.sbt

    # Library dependenciees
    echo "/** Library dependencies can be stated below, they will only be downloaded once**/" >> build.sbt
    echo "libraryDependencies ++= {" >> build.sbt
    echo "    /** Variables (such as version numbers) can be defined within this block **/" >> build.sbt
    echo "" >> build.sbt
    echo "    Seq()" >> build.sbt
    echo "}" >> build.sbt
    echo "" >> build.sbt
}


# Creates a directory tree structure that 'sbt' recognizes:
# src/
#    main/
#        resources/
#        scala/
#    test/
#        resources/
#        scala/
function create_src_directory_tree {
    mkdir src
    mkdir src/main
    mkdir src/main/resources
    mkdir src/main/scala
    mkdir src/test
    mkdir src/test/resources
    mkdir src/test/scala
}

create_sbt_skeleton_project

