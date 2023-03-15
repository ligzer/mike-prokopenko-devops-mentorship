
## Script test-1.sh

```shell
#!/bin/bash
# Understanding of streams
```

![run cat](screenshots/17492.jpg)

![run cat < testfile](screenshots/1718.jpg)

![run ls -l > test2; cat test2](screenshots/18538.jpg)

![run who >> test2; cat test2](screenshots/1799.jpg)

![run ls -al badfile > test3; cat test3](screenshots/28138.jpg)

![run ls -al badfile 2> test4; cat test4](screenshots/5810.jpg)

![run ls -al test badtest test2 2> test5; cat test5](screenshots/21773.jpg)

![run ls -al test test2 test3 badtest 2> test6 1> test7; cat test6 ; cat test7](screenshots/6812.jpg)

![run ls -al test test2 test3 badtest &> test7; cat test7](screenshots/31842.jpg)
## Script test-8.sh

```shell
#!/bin/bash
# testing STDERR messages
echo "This is an error" >&2
echo "This is normal output"

```

![run ./test-8.sh](screenshots/29223.jpg)

![run ./test-8.sh 2> test9; cat test9](screenshots/25132.jpg)
## Script test-10.sh

```shell
#!/bin/bash
# redirecting all output to a file
exec 1>testout
echo "This is a test of redirecting all output"
echo "from a script to another file."
echo "without having to redirect every individual line"
```

![run ./test-10.sh; cat testout](screenshots/3360.jpg)
## Script test-11.sh

```shell
#!/bin/bash
# redirecting output to different locations
exec 2>testerror
echo "This is the start of the script"
echo "now redirecting all output to another location"
exec 1>testout
echo "This output should go to the testout file"
echo "but this should go to the testerror file" >&2

```

![run ./test-11.sh; cat testout; cat testerror](screenshots/27791.jpg)
## Script test-12.sh

```shell
#!/bin/bash
# redirecting file input
exec 0< testfile
count=1
while read line
do
echo "Line #$count: $line"
count=$[ $count + 1 ]
done

```

![run ./test-12.sh](screenshots/20080.jpg)
## Script test-13.sh

```shell
#!/bin/bash
# using an alternative file descriptor
exec 3>test13out
echo "This should display on the monitor"
echo "and this should be stored in the file" >&3
echo "Then this should be back on the monitor"

```

![run ./test-13.sh; cat test13out](screenshots/6429.jpg)
## Script test-14.sh

```shell
#!/bin/bash
# storing STDOUT, then coming back to it
exec 3>&1
exec 1>test14out
echo "This should store in the output file"
echo "along with this line."
exec 1>&3
echo "Now things should be back to normal"
```

![run ./test-14.sh; cat test14out](screenshots/22974.jpg)
## Script test-15.sh

```shell
#!/bin/bash
# redirecting input file descriptors
exec 6<&0
exec 0< testfile
count=1
while read line
do
echo "Line #$count: $line"
count=$[ $count + 1 ]
done
exec 0<&6
read -p "Are you done now? " answer
case $answer in
Y|y) echo "Goodbye";;
N|n) echo "Sorry, this is the end.";;
esac

```

![run ./test-15.sh](screenshots/8983.jpg)
## Script test-16.sh

```shell
#!/bin/bash
# testing input/output file descriptor
exec 3<> testfile
read line <&3
echo "Read: $line"
echo "This is a test line" >&3
```

![run ./test-16.sh; cat testfile](screenshots/25197.jpg)
## Script badtest.sh

```shell
#!/bin/bash
# testing closing file descriptors
exec 3> test17file
echo "This is a test line of data" >&3
exec 3>&-
echo "This won't work" >&3

```

![run ./badtest.sh](screenshots/15680.jpg)
## Script test-17.sh

```shell
#!/bin/bash
# testing closing file descriptors
exec 3> test17file
echo "This is a test line of data" >&3
exec 3>&-
cat test17file
exec 3> test17file
echo "This'll be bad" >&3

```

![run ./test-17.sh; cat test17file](screenshots/17060.jpg)
## Script test-18.sh

```shell
#!/bin/bash
# testing lsof with file descriptors
exec 3> test18file1
exec 6> test18file2
exec 7< testfile
/usr/sbin/lsof -a -p $$ -d0,1,2,3,6,7

```

![run ./test-18.sh](screenshots/31188.jpg)
## Script test-19.sh

```shell
#!/bin/bash
# creating and using a temp file
tempfile=$(mktemp test19.XXXXXX)
exec 3>$tempfile
echo "This script writes to temp file $tempfile"
echo "This is the first line" >&3
echo "This is the second line." >&3
echo "This is the last line." >&3
exec 3>&-
echo "Done creating temp file. The contents are:"
cat $tempfile
rm -f $tempfile 2> /dev/null
```

![run ls -al > /dev/null](screenshots/30179.jpg)

![run cat /dev/null](screenshots/10394.jpg)

![run ls -al badfile test16 2> /dev/null](screenshots/6341.jpg)

![run cat testfile](screenshots/32554.jpg)

![run cat /dev/null > testfile](screenshots/22167.jpg)

![run cat testfile](screenshots/500.jpg)

![run ./test-19.sh](screenshots/1020.jpg)
## Script test-20.sh

```shell
#!/bin/bash
# creating a temp file in /tmp
tempfile=$(mktemp -t tmp.XXXXXX)
echo "This is a test file." > $tempfile
echo "This is the second line of the test." >> $tempfile
echo "The temp file is located at: $tempfile"
cat $tempfile
rm -f $tempfile

```

![run ./test-20.sh](screenshots/16847.jpg)
## Script test-21.sh

```shell
#!/bin/bash
# using a temporary directory
tempdir=$(mktemp -d dir.XXXXXX)
cd $tempdir
tempfile1=$(mktemp temp.XXXXXX)
tempfile2=$(mktemp temp.XXXXXX)
exec 7> $tempfile1
exec 8> $tempfile2
echo "Sending data to directory $tempdir"
echo "This is a test line of data for $tempfile1" >&7
echo "This is a test line of data for $tempfile2" >&8

```

![run ./test-21.sh](screenshots/3838.jpg)
## Script test-22.sh

```shell
#!/bin/bash
# using the tee command for logging
tempfile=test22file
echo "This is the start of the test" | tee $tempfile
echo "This is the second line of the test" | tee -a $tempfile
echo "This is the end of the test" | tee -a $tempfile

```

![run ./test-22.sh](screenshots/5153.jpg)
## Script test-23.sh

```shell
#!/bin/bash
# read file and create INSERT statements for MySQL
outfile='members.sql'
IFS=','
while read lname fname address city state zip
do
cat >> $outfile << EOF
INSERT INTO members (lname,fname,address,city,state,zip) VALUES
('$lname', '$fname', '$address', '$city', '$state', '$zip');
EOF
done < ${1}

```

![run ./test-23.sh members.csv ; cat members.sql](screenshots/19305.jpg)
