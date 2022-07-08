# Java

## Installation

```sh
brew search java
.
==> Formulae
app-engine-java         java                    java11                  javarepl                libreadline-java
google-java-format      java-service-wrapper    javacc                  jslint4java             pdftk-java

==> Casks
charles-applejava   eclipse-java        eclipse-javascript  java-beta           java6               oracle-jdk-javadoc

If you meant "java" specifically:
It was migrated from homebrew/cask to homebrew/core.
```

Add a tap for AdoptOpenJDK

```sh
brew tap adoptopenjdk/openjdk
```

See what is available

```sh
brew search adoptopenjdk
.
Error: Cask adoptopenjdk8 exists in multiple taps:
  homebrew/cask-versions/adoptopenjdk8
  adoptopenjdk/openjdk/adoptopenjdk8
```

Remove `homebrew/cask-versions/adoptopenjdk8`

```sh
rm /opt/homebrew/Library/Taps/homebrew/homebrew-cask-versions/Casks/adoptopenjdk8.rb
```

Try again to see what is available

```sh
brew search adoptopenjdk
.
==> Casks
adoptopenjdk                                                 adoptopenjdk/openjdk/adoptopenjdk13-openj9-large
adoptopenjdk/openjdk/adoptopenjdk-jre                        adoptopenjdk/openjdk/adoptopenjdk14
adoptopenjdk/openjdk/adoptopenjdk-openj9                     adoptopenjdk/openjdk/adoptopenjdk14-jre
adoptopenjdk/openjdk/adoptopenjdk-openj9-jre                 adoptopenjdk/openjdk/adoptopenjdk14-openj9
adoptopenjdk/openjdk/adoptopenjdk-openj9-jre-large           adoptopenjdk/openjdk/adoptopenjdk14-openj9-jre
adoptopenjdk/openjdk/adoptopenjdk-openj9-large               adoptopenjdk/openjdk/adoptopenjdk14-openj9-jre-large
adoptopenjdk/openjdk/adoptopenjdk10                          adoptopenjdk/openjdk/adoptopenjdk14-openj9-large
adoptopenjdk/openjdk/adoptopenjdk11                          adoptopenjdk/openjdk/adoptopenjdk15
adoptopenjdk/openjdk/adoptopenjdk11-jre                      adoptopenjdk/openjdk/adoptopenjdk15-jre
adoptopenjdk/openjdk/adoptopenjdk11-openj9                   adoptopenjdk/openjdk/adoptopenjdk15-openj9
adoptopenjdk/openjdk/adoptopenjdk11-openj9-jre               adoptopenjdk/openjdk/adoptopenjdk15-openj9-jre
adoptopenjdk/openjdk/adoptopenjdk11-openj9-jre-large         adoptopenjdk/openjdk/adoptopenjdk15-openj9-jre-large
adoptopenjdk/openjdk/adoptopenjdk11-openj9-large             adoptopenjdk/openjdk/adoptopenjdk15-openj9-large
adoptopenjdk/openjdk/adoptopenjdk12                          adoptopenjdk/openjdk/adoptopenjdk16
adoptopenjdk/openjdk/adoptopenjdk12-jre                      adoptopenjdk/openjdk/adoptopenjdk16-jre
adoptopenjdk/openjdk/adoptopenjdk12-openj9                   adoptopenjdk/openjdk/adoptopenjdk16-openj9
adoptopenjdk/openjdk/adoptopenjdk12-openj9-jre               adoptopenjdk/openjdk/adoptopenjdk16-openj9-jre
adoptopenjdk/openjdk/adoptopenjdk12-openj9-jre-large         adoptopenjdk/openjdk/adoptopenjdk8
adoptopenjdk/openjdk/adoptopenjdk12-openj9-large             adoptopenjdk/openjdk/adoptopenjdk8-jre
adoptopenjdk/openjdk/adoptopenjdk13                          adoptopenjdk/openjdk/adoptopenjdk8-openj9
adoptopenjdk/openjdk/adoptopenjdk13-jre                      adoptopenjdk/openjdk/adoptopenjdk8-openj9-jre
adoptopenjdk/openjdk/adoptopenjdk13-openj9                   adoptopenjdk/openjdk/adoptopenjdk8-openj9-jre-large
adoptopenjdk/openjdk/adoptopenjdk13-openj9-jre               adoptopenjdk/openjdk/adoptopenjdk8-openj9-large
adoptopenjdk/openjdk/adoptopenjdk13-openj9-jre-large         adoptopenjdk/openjdk/adoptopenjdk9
```

```sh
brew install adoptopenjdk11
.
==> Downloading https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.11%2B9/OpenJDK11U-jdk_x64_
==> Downloading from https://objects.githubusercontent.com/github-production-release-asset-2e65be/140419044/15623b80-a2e
######################################################################## 100.0%
==> Installing Cask adoptopenjdk11
==> Running installer for adoptopenjdk11; your password may be necessary.
Package installers may write to any location; options such as `--appdir` are ignored.
Password:
installer: Package name is AdoptOpenJDK
installer: Installing at base path /
installer: The install was successful.
package-id: net.adoptopenjdk.11.jdk
version: 11.0.11+9
volume: /
location:
install-time: 1657193808
🍺  adoptopenjdk11 was successfully installed!
```

Check version of java, and where it is, and file listing

```sh
java --version
.
openjdk 11.0.11 2021-04-20
OpenJDK Runtime Environment AdoptOpenJDK-11.0.11+9 (build 11.0.11+9)
OpenJDK 64-Bit Server VM AdoptOpenJDK-11.0.11+9 (build 11.0.11+9, mixed mode)
.
which java
.
/usr/bin/java
.
ls -asl /usr/bin/java
.
40 -rwxr-xr-x  52 root  wheel  168432  9 May 22:30 /usr/bin/java
```

Check architecture

```sh
file /usr/bin/java
.
/usr/bin/java: Mach-O universal binary with 2 architectures: [x86_64:Mach-O 64-bit executable x86_64
- Mach-O 64-bit executable x86_64] [arm64e:Mach-O 64-bit executable arm64e
- Mach-O 64-bit executable arm64e]
/usr/bin/java (for architecture x86_64):	Mach-O 64-bit executable x86_64
/usr/bin/java (for architecture arm64e):	Mach-O 64-bit executable arm64e
```

Find out where JAVA_HOME should point to

```sh
/usr/libexec/java_home
.
/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
```

Check all installed JDKs

```sh
/usr/libexec/java_home -V
.
Matching Java Virtual Machines (1):
    11.0.11 (x86_64) "AdoptOpenJDK" - "AdoptOpenJDK 11" /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
```

Check the bin file

```sh
file /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin/java
.
/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin/java: Mach-O 64-bit executable x86_64
```

Looks wrong, wrong architecture...

Reference https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/
