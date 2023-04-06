import 'package:string_width/string_width.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    expect(stringWidth('abcde'), 5);
    expect(stringWidth('古池や'), 6);
    expect(stringWidth('あいうabc'), 9);
    expect(stringWidth('あいう★'), 7);
    expect(stringWidth('あいう★', ambiguousIsNarrow: false), 8);
    expect(stringWidth('±'), 1);
    expect(stringWidth('ノード.js'), 9);
    expect(stringWidth('你好'), 4);
    expect(stringWidth('안녕하세요'), 10);
    expect(stringWidth('A\uD83C\uDE00BC'), 5, reason: 'surrogate');
    expect(stringWidth('\u001B[31m\u001B[39m'), 0);
    expect(
        stringWidth('\u001B]8;;https://github.com\u0007Click\u001B]8;;\u0007'),
        5);
    expect(stringWidth('\u{231A}'), 2,
        reason: '⌚ default emoji presentation character (Emoji_Presentation)');
    expect(stringWidth('\u{2194}\u{FE0F}'), 2,
        reason: '↔️ default text presentation character rendered as emoji');
    expect(stringWidth('\u{1F469}'), 2,
        reason: '👩 emoji modifier base (Emoji_Modifier_Base)');
    expect(stringWidth('\u{1F469}\u{1F3FF}'), 2,
        reason: '👩🏿 emoji modifier base followed by a modifier');
    expect(stringWidth('\u{1FAF6}'), 2,
        reason:
            '🫶 E14.0 heart hands emoji modifier base (Emoji_Modifier_Base)');
  });
  test('ignores control characters', () {
    expect(stringWidth(String.fromCharCode(0)), 0);
    expect(stringWidth(String.fromCharCode(31)), 0);
    expect(stringWidth(String.fromCharCode(127)), 0);
    expect(stringWidth(String.fromCharCode(134)), 0);
    expect(stringWidth(String.fromCharCode(159)), 0);
    expect(stringWidth('\u001B'), 0);
  });

  test('handles combining characters', () {
    expect(stringWidth('x\u0300'), 1);
  });

  test('handles ZWJ characters', () {
    expect(stringWidth('👶'), 2);
    expect(stringWidth('👶🏽'), 2);
    expect(stringWidth('👩‍👩‍👦‍👦'), 2);
    expect(stringWidth('👨‍❤️‍💋‍👨'), 2);
  });
}
