import 'package:ansi_strip/ansi_strip.dart';
import 'package:characters/characters.dart';
import 'package:east_asian_width/east_asian_width.dart';
import 'package:emoji_regex/emoji_regex.dart';

///
/// Get the visual width of a string [input] - the number of columns required to display it
///
int stringWidth(String input, {bool ambiguousIsNarrow = true}) {
  if (input.isEmpty) {
    return 0;
  }
  input = stripAnsi(input);
  if (input.isEmpty) {
    return 0;
  }
  input = input.replaceAll(emojiRegex(), '  ');
  final ambiguousCharacterWidth = ambiguousIsNarrow ? 1 : 2;
  int width = 0;
  for (var character in input.characters) {
    final codePoint = character.codeUnitAt(0);
    // Ignore control characters
    if (codePoint <= 0x1F || (codePoint >= 0x7F && codePoint <= 0x9F)) {
      continue;
    }

    // Ignore combining characters
    if (codePoint >= 0x300 && codePoint <= 0x36F) {
      continue;
    }

    final code = eastAsianWidth(character);
    switch (code) {
      case EastAsianWidth.fullwidth:
      case EastAsianWidth.wide:
        width += 2;
        break;
      case EastAsianWidth.ambiguous:
        width += ambiguousCharacterWidth;
        break;
      default:
        width += 1;
    }
  }

  return width;
}
