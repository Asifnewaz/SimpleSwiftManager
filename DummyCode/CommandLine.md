# Command Line Code

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
