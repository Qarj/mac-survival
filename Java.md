# Java

## Installation

https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/downloads-list.html

Download the .pkg file, double click on it and follow the instructions.

Check version of java, and where it is, and file listing

```sh
java --version
.
openjdk 21.0.6 2025-01-21 LTS
OpenJDK Runtime Environment Corretto-21.0.6.7.1 (build 21.0.6+7-LTS)
OpenJDK 64-Bit Server VM Corretto-21.0.6.7.1 (build 21.0.6+7-LTS, mixed mode, sharing)
.
which java
.
/usr/bin/java
.
ls -asl /usr/bin/java
.
40 -rwxr-xr-x  52 root  wheel  135632 15 Jan 14:21 /usr/bin/java
```

Check architecture

```sh
file /usr/bin/java
.
/usr/bin/java: Mach-O universal binary with 2 architectures: [x86_64:Mach-O 64-bit executable x86_64] [arm64e:Mach-O 64-bit executable arm64e]
/usr/bin/java (for architecture x86_64):	Mach-O 64-bit executable x86_64
/usr/bin/java (for architecture arm64e):	Mach-O 64-bit executable arm64e
```

Find out where JAVA_HOME should point to

```sh
/usr/libexec/java_home
.
/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
```

Add it to `.bash_profile`

```sh
# java
export JAVA_HOME=$(/usr/libexec/java_home)
```

Check all installed JDKs

```sh
/usr/libexec/java_home -V
.
Matching Java Virtual Machines (1):
    21.0.6 (x86_64) "Amazon.com Inc." - "Amazon Corretto 21" /Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
```

Check the bin file

```sh
file /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin/java
.
/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home/bin/java: Mach-O 64-bit executable x86_64
```

Looks wrong, wrong architecture...

Reference https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/
