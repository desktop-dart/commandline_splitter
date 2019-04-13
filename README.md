# Command line splitter

Splits command line string into a list of individual parts suitable for using with Process.start or Process.run.

Similar to [shlex.split](https://docs.python.org/2/library/shlex.html) in python.

## Example

```dart
import 'package:commandline_splitter/commandline_splitter.dart';

main() {
  print(split('bash -c "uname -a"')); // => [bash, -c, "uname -a"]
}
```
