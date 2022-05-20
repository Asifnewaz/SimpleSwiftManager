# Command Line Code

## Open .a type file 
```bash
ar x fileName.a
```

If there is error like this: XXX.A is a FAT file (use Libtool (1) or Lipo (1) and AR (1) on it) error, after looking for information, originally because the .a file includes multiple CPU architectures, for example Armv7,ar Mv7s, etc., can be used such as the following command:
```bash
Lipo XX. A-thin Armv7-output xx_armv7.a
```
or 
```bash
Lipo Lxx. A-thin Armv7s-output XX_ARMV7S.A
```

Ability to reference: Ar:is a FAT file (use Libtool (1) or Lipo (1) and AR (1) on it). Then use, Ar-x xx_armv7.a
```bash
Ar-x xx_armv7.a
```
will be able to successfully extract the various. O. Suppose you also want to see the. O's anti-compilation code, which can be used to decompile the. o file on the Mac using the Otool command. For example Otool-tv XX.O can refer to: Mac's anti-compilation Tool One: Otool (Objdump tool's OSX corresponding tool).

Link: 
[SO](https://stackoverflow.com/a/2703713/3124756)  
[Blog](https://topic.alibabacloud.com/a/ar-command-extract-a-moment-an-error-is-a-fat-file-use-libtool-1-or-lipo-1-and-ar-1-on-it_8_8_31350040.html)

## [Open .o file](https://stackoverflow.com/a/36002253/3124756)
```bash
objdump -D test.o
```

## For release android apk from visual studio code, 
```bash
flutter build apk --release
```

## Open new window for visual studio on Mac
```bash
open -n -a "Visual Studio"
```

## Run Java jar file with main class name
```bash
java -cp "CBUPISocketServer.jar:bcprovjdk15on.jar" com.cbupi.cbupisocket.CbUpiSocketApplication
```
Here,
* `CBUPISocketServer.jar` is the jar file that contains main class that is `com.cbupi.cbupisocket.CbUpiSocketApplication`.
* `bcprovjdk15on.jar` is a jar file that is used in `CBUPISocketServer.jar`. That is all the dependency file's name should be include using `:` after the file's name.
* `:` is used for MAC, `;` is used for Windows 
