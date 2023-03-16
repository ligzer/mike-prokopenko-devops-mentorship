## Script test-1.sh 

```shell 
#!/bin/bash
# Testing signal trapping
#
trap "echo ' Sorry! I have trapped Ctrl-C'" SIGINT
#
echo This is a test script
#
count=1
while [ $count -le 10 ]
do
echo "Loop #$count"
sleep 1
count=$[ $count + 1 ]
done
#
echo "This is the end of the test script"
#
```

![run ](screenshots/25746.jpg)

## Script test-2.sh

```shell
#!/bin/bash
# Trapping the script exit
#
trap "echo Goodbye..." EXIT
#
count=1
while [ $count -le 5 ]
do
echo "Loop #$count"
sleep 1
count=$[ $count + 1 ]
done
#

```

![run ](screenshots/458.jpg)

## Script test-3.sh

```shell
#!/bin/bash
# Modifying a set trap
#
trap "echo ' Sorry... Ctrl-C is trapped.'" SIGINT
#
count=1
while [ $count -le 5 ]
do
echo "Loop #$count"
sleep 1
count=$[ $count + 1 ]
done
#
trap "echo ' I modified the trap!'" SIGINT
#
count=1
while [ $count -le 5 ]
do
echo "Second Loop #$count"
sleep 1
count=$[ $count + 1 ]
done
#
```

![run ](screenshots/28856.jpg)

## Script test-3b.sh

```shell
#!/bin/bash
# Removing a set trap
#
trap "echo ' Sorry... Ctrl-C is trapped.'" SIGINT
#
count=1
while [ $count -le 5 ]
do
echo "Loop #$count"
sleep 1
count=$[ $count + 1 ]
done
#
# Remove the trap
trap -- SIGINT
echo "I just removed the trap"
#
count=1
while [ $count -le 5 ]
do
echo "Second Loop #$count"
sleep 1
count=$[ $count + 1 ]
done
#
```

![run ](screenshots/10047.jpg)

## Script test-4.sh

```shell
#!/bin/bash
# Test running in the background
#
count=1
while [ $count -le 10 ]
do
sleep 1
count=$[ $count + 1 ]
done
#
```

![run ](screenshots/23509.jpg)

## Script test-5.sh

```shell
#!/bin/bash
# Test running in the background with output
#
echo "Start the test script"
count=1
while [ $count -le 5 ]
do
echo "Loop #$count"
sleep 5
count=$[ $count + 1 ]
done
#
echo "Test script is complete"
#

```

![run ](screenshots/18018.jpg)

## Script test-[6-9].sh

```shell
#!/bin/bash
#
echo This is a test script
sleep 1m
```

![run ](screenshots/13686.jpg)

## nohup test-1.sh

![run ](screenshots/1168.jpg)

## Script 

```shell
#!/bin/bash
# Test job control
#
echo "Script Process ID: $$"
#
count=1
while [ $count -le 10 ]
do
echo "Loop #$count"
sleep 10
count=$[ $count + 1 ]
done
#
echo "End of script..."
#
```

![run ](screenshots/32010.jpg)

![run ](screenshots/31899.jpg)

## Jobs

![run ](screenshots/17.jpg)

## Nice 

![run ](screenshots/9228.jpg)

![run ](screenshots/29798.jpg)

![run ](screenshots/29740.jpg)

## Script test-13.sh

```shell
#!/bin/bash
# Test using at command
#
echo "This script ran at $(date +%B%d,%T)"
echo
sleep 5
echo "This is the script's end..."
#
```

![run ](screenshots/12850.jpg)

## Script test-13b.sh

```shell
#!/bin/bash
# Test using at command
#
echo "This script ran at $(date +%B%d,%T)" > test13b.out
echo >> test13b.out
sleep 5
echo "This is the script's end..." >> test13b.out
#
```

![run ](screenshots/6183.jpg)

![run ](screenshots/30115.jpg)

![run ](screenshots/22919.jpg)

## Cron

![run ](screenshots/2028.jpg)

![run ](screenshots/14696.jpg)

![run ](screenshots/22883.jpg)

![run ](screenshots/5861.jpg)

