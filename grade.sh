CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


tests=`find student-submission -name "ListExample*.java"`


cp $tests *Test*.java grading-area 
cp *Test*.java grading-area
cp ./student-submission/* grading-area

cp -R lib grading-area
cd grading-area

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
for file in $tests
do  
    echo $file
    output=`java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore *Test*.java`
    echo $output

done

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests