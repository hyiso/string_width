# string_width

> Get the visual width of a string - the number of columns required to display it

Some Unicode characters are [fullwidth](https://en.wikipedia.org/wiki/Halfwidth_and_fullwidth_forms) and use double the normal width. [ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code) are stripped and doesn't affect the width.

Useful to be able to measure the actual width of command-line output.

## Install

```bash
$ dart pub add string_width
```

## Usage

```dart
import 'package:string_width/string_width.dart';

void main() {
  print(stringWidth('a'));
  //=> 1

  print(stringWidth('古'));
  //=> 2

  print(stringWidth('\u001B[1m古\u001B[22m'));
  //=> 2
}

```
