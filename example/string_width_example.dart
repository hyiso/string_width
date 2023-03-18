import 'package:string_width/string_width.dart';

void main() {
  print(stringWidth('a'));
  //=> 1

  print(stringWidth('古'));
  //=> 2

  print(stringWidth('\u001B[1m古\u001B[22m'));
  //=> 2
}
