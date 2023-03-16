
## Script test-1.sh

```shell
#!/bin/bash
# using one command line parameter
#
factorial=1
for (( number = 1; number <= $1 ; number++ ))
do
factorial=$[ $factorial * $number ]
done
echo The factorial of $1 is $factorial
```

![run ./test-1.sh 5](screenshots/19078.jpg)
## Script test-2.sh

```shell
#!/bin/bash
# testing two command line parameters
#
total=$[ $1 * $2 ]
echo The first parameter is $1.
echo The second parameter is $2.
echo The total value is $total.
```

![run ./test-2.sh 2 5](screenshots/18930.jpg)
## Script test-3.sh

```shell
#!/bin/bash
# testing string parameters
#
echo Hello $1, glad to meet you.
```

![run ./test-3.sh Rich](screenshots/24607.jpg)

![run ./test-3.sh Rich Blum](screenshots/23408.jpg)

![run ./test-3.sh 'Rich Blum'](screenshots/23809.jpg)

![run ./test-3.sh "Rich Blum"](screenshots/31698.jpg)
## Script test-4.sh

```shell
#!/bin/bash
# handling lots of parameters
#
total=$[ ${10} * ${11} ]
echo The tenth parameter is ${10}
echo The eleventh parameter is ${11}
echo The total is $total
```

![run ./test-4.sh 1 2 3 4 5 6 7 8 9 10 11 12](screenshots/4969.jpg)
## Script test-5.sh

```shell
#!/bin/bash
# Testing the $0 parameter
#
echo The zero parameter is set to: $0
#
```

![run bash test-5.sh](screenshots/10796.jpg)

![run bash /home/centos/mike-prokopenko-week3/chapter14/test-5.sh](screenshots/10726.jpg)
## Script test-5b.sh

```shell
#!/bin/bash
# Using basename with the $0 parameter
#
name=$(basename $0)
echo
echo The script name is: $name
#
```

![run bash /home/centos/mike-prokopenko-week3/chapter14/test-5b.sh](screenshots/21938.jpg)

![run ./test-5b.sh](screenshots/25558.jpg)
## Script test-6.sh

```shell
#!/bin/bash
# Testing a Multi-function script
#
name=$(basename $0)
#
if [ $name = "addem" ]
then
total=$[ $1 + $2 ]
#
elif [ $name = "multem" ]
then
total=$[ $1 * $2 ]
fi
#
echo
echo The calculated value is $total
```

![run cp test-6.sh addem && chmod u+x addem && ln -s test-6.sh multem && ls -l *em](screenshots/4172.jpg)

![run ./addem 2 5](screenshots/6262.jpg)

![run ./multem 2 5](screenshots/13743.jpg)
## Script test-7.sh

```shell
#!/bin/bash
# testing parameters before use
#
if [ -n "$1" ]
then
echo Hello $1, glad to meet you.
else
echo "Sorry, you did not identify yourself. "
fi
```

![run ./addem 2](screenshots/6541.jpg)

![run ./test-7.sh Rich](screenshots/32103.jpg)

![run ./test-7.sh](screenshots/14127.jpg)
## Script test-8.sh

```shell
#!/bin/bash
# getting the number of parameters
#
echo There were $# parameters supplied.
```

![run ./test-8.sh](screenshots/18841.jpg)

![run ./test-8.sh 1 2 3 4 5](screenshots/8198.jpg)

![run ./test-8.sh 1 2 3 4 5 6 7 8 9 10](screenshots/27339.jpg)

![run ./test-8.sh "Rich Blum"](screenshots/4499.jpg)
## Script test-9.sh

```shell
#!/bin/bash
# Testing parameters
#
if [ $# -ne 2 ]
then
echo
echo Usage: test9.sh a b
echo
else
total=$[ $1 + $2 ]
echo
echo The total is $total
echo
fi
```

![run bash test-9.sh](screenshots/24076.jpg)

![run bash test-9.sh 10](screenshots/13007.jpg)

![run bash test-9.sh 10 15](screenshots/24847.jpg)
## Script badtest-1.sh

```shell
#!/bin/bash
# testing grabbing last parameter
#
echo The last parameter was ${$#}
```

![run ./badtest-1.sh 10](screenshots/27640.jpg)
## Script test-10.sh

```shell
#!/bin/bash
# Grabbing the last parameter
#
params=$#
echo
echo The last parameter is $params
echo The last parameter is ${!#}
echo
```

![run bash test-10.sh 1 2 3 4 5](screenshots/19848.jpg)

![run bash test-10.sh](screenshots/20383.jpg)
## Script test-11.sh

```shell
#!/bin/bash
# testing $* and $@
#
echo
echo "Using the \$* method: $*"
echo
echo "Using the \$@ method: $@"
```

![run ./test-11.sh rich barbara katie jessica](screenshots/11696.jpg)
## Script test-12.sh

```shell
#!/bin/bash
# testing $* and $@
#
echo
count=1
#
for param in "$*"
do
echo "\$* Parameter #$count = $param"
count=$[ $count + 1 ]
done
#
echo
count=1
#
for param in "$@"
do
echo "\$@ Parameter #$count = $param"
count=$[ $count + 1 ]
done
```

![run ./test-12.sh rich barbara katie jessica](screenshots/7627.jpg)
## Script test-13.sh

```shell
#!/bin/bash
# demonstrating the shift command
echo
count=1
while [ -n "$1" ]
do
echo "Parameter #$count = $1"
count=$[ $count + 1 ]
shift
done
```

![run ./test-13.sh rich barbara katie jessica](screenshots/27465.jpg)
## Script test-14.sh

```shell
#!/bin/bash
# demonstrating a multi-position shift
#
echo
echo "The original parameters: $*"
shift 2
echo "Here's the new first parameter: $1"
```

![run ./test-14.sh 1 2 3 4 5](screenshots/30978.jpg)
## Script test-15.sh

```shell
#!/bin/bash
# extracting command line options as parameters
#
echo
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) echo "Found the -b option" ;;
-c) echo "Found the -c option" ;;
*) echo "$1 is not an option" ;;
esac
shift
done
```

![run ./test-15.sh -a -b -c -d](screenshots/14714.jpg)

![run ./test-15.sh -d -c -a](screenshots/9804.jpg)
## Script test-16.sh

```shell
#!/bin/bash
# extracting options and parameters
echo
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) echo "Found the -b option";;
-c) echo "Found the -c option" ;;
--) shift
break ;;
*) echo "$1 is not an option";;
esac
shift
done
#
count=1
for param in $@
do
echo "Parameter #$count: $param"
count=$[ $count + 1 ]
done
```

![run ./test-16.sh -c -a -b test-1 test-2 test-3](screenshots/4637.jpg)

![run ./test-16.sh -c -a -b -- test-1 test-2 test-3](screenshots/18904.jpg)
## Script test-17.sh

```shell
#!/bin/bash
# extracting command line options and values
echo
while [ -n "$1" ]
do
  case "$1" in
    -a) echo "Found the -a option";;
    -b) param="$2"
    echo "Found the -b option, with parameter value $param"
    shift ;;
    -c) echo "Found the -c option";;
    --) shift
    break ;;
    *) echo "$1 is not an option";;
  esac
  shift
done
#
count=1
for param in "$@"
do
echo "Parameter #$count: $param"
count=$[ $count + 1 ]
done
```

![run ./test-17.sh -a -b test-1 -d](screenshots/8286.jpg)

![run ./test-17.sh -b test-1 -a -d](screenshots/18551.jpg)

![run ./test-17.sh -ac](screenshots/8335.jpg)
## Script test-18.sh

```shell
#!/bin/bash
# Extract command line options & values with getopt
#
set -- $(getopt -q ab:cd "$@")
#
echo
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) param="$2"
echo "Found the -b option, with parameter value $param"
shift ;;
-c) echo "Found the -c option" ;;
--) shift
break ;;
*) echo "$1 is not an option";;
esac
shift
done
#
count=1
for param in "$@"
do
echo "Parameter #$count: $param"
count=$[ $count + 1 ]
done
#
```

![run getopt ab:cd -a -b test-1 -cd test-2 test-3](screenshots/31299.jpg)

![run getopt ab:cd -a -b test-1 -cde test-2 test-3](screenshots/1419.jpg)

![run getopt -q ab:cd -a -b test-1 -cde test-2 test-3](screenshots/9607.jpg)

![run ./test-18.sh -ac](screenshots/30626.jpg)

![run ./test-18.sh -a -b test-1 -cd test-2 test-3 test-4](screenshots/31706.jpg)

![run ./test-18.sh -a -b test-1 -cd "test-2 test-3" test-4](screenshots/3685.jpg)
## Script test-19.sh

```shell
#!/bin/bash
# simple demonstration of the getopts command
#
echo
while getopts :ab:c opt
do
case "$opt" in
a) echo "Found the -a option" ;;
b) echo "Found the -b option, with value $OPTARG";;
c) echo "Found the -c option" ;;
*) echo "Unknown option: $opt";;
esac
done

```

![run ./test-19.sh -ab test-1 -c](screenshots/17736.jpg)

![run ./test-19.sh -b "test-1 test-2" -a](screenshots/14514.jpg)

![run ./test-19.sh -abtest-1](screenshots/7117.jpg)

![run ./test-19.sh -d](screenshots/23914.jpg)

![run ./test-19.sh -acde](screenshots/8329.jpg)
## Script test-20.sh

```shell
#!/bin/bash
# Processing options & parameters with getopts
#
echo
while getopts :ab:cd opt
do
case "$opt" in
a) echo "Found the -a option" ;;
b) echo "Found the -b option, with value $OPTARG" ;;
c) echo "Found the -c option" ;;
d) echo "Found the -d option" ;;
*) echo "Unknown option: $opt" ;;
esac
done
#
shift $[ $OPTIND - 1 ]
#
echo
count=1
for param in "$@"
do
echo "Parameter $count: $param"
count=$[ $count + 1 ]
done
```

![run ./test-20.sh -a -b test-1 -d test-2 test-3 test-4](screenshots/18199.jpg)
## Script test-21.sh

```shell
#!/bin/bash
# testing the read command
#
echo -n "Enter your name: "
read name
echo "Hello $name, welcome to my program. "
#
```

![run ./test-21.sh # Enter your name](screenshots/233.jpg)
## Script test-22.sh

```shell
#!/bin/bash
# testing the read -p option
#
read -p "Please enter your age: " age
days=$[ $age * 365 ]
echo "That makes you over $days days old! "
#
```

![run ./test-22.sh # Enter your age](screenshots/31255.jpg)
## Script test-23.sh

```shell
#!/bin/bash
# entering multiple variables
#
read -p "Enter your name: " first last
echo "Checking data for $last, $first..."
```

![run ./test-23.sh # Enter Name and Surname](screenshots/31153.jpg)
## Script test-24.sh

```shell
#!/bin/bash
# Testing the REPLY Environment variable
#
read -p "Enter your name: "
echo
echo Hello $REPLY, welcome to my program.

```

![run ./test-24.sh # Enter Name](screenshots/24292.jpg)
## Script test-25.sh

```shell
#!/bin/bash
# timing the data entry
#
if read -t 5 -p "Please enter your name: " name
then
echo "Hello $name, welcome to my script"
else
echo
echo "Sorry, too slow! "
fi
```

![run ./test-25.sh # Quickly!](screenshots/4459.jpg)

![run ./test-25.sh # Wait untill timeout](screenshots/19271.jpg)
## Script test-26.sh

```shell
#!/bin/bash
# getting just one character of input
#
read -n1 -p "Do you want to continue [Y/N]? " answer
case $answer in
Y | y) echo
echo "fine, continue on...";;
N | n) echo
echo OK, goodbye
exit;;
esac
echo "This is the end of the script"
```

![run ./test-26.sh # Enter Y](screenshots/17799.jpg)

![run ./test-26.sh # Enter n](screenshots/15786.jpg)
## Script test-27.sh

```shell
#!/bin/bash
# hiding input data from the monitor
#
read -s -p "Enter your password: " pass
echo
echo "Is your password really $pass? "

```

![run ./test-27.sh # Enter secret](screenshots/13217.jpg)
## Script test-28.sh

```shell
#!/bin/bash
# reading data from a file
#
count=1
cat test | while read line
do
echo "Line $count: $line"
count=$[ $count + 1]
done
echo "Finished processing the file"

```

![run ./test-28.sh](screenshots/24501.jpg)
