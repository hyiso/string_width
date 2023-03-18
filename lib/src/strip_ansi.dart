final RegExp _stripRegex = RegExp(
  [
    r'[\u001B\u009B][[\]()#;?]*(?:(?:(?:[a-zA-Z\d]*(?:;[-a-zA-Z\d\/#&.:=?%@~_]*)*)?\u0007)',
    r'(?:(?:\d{1,4}(?:;\\d{0,4})*)?[\dA-PR-TZcf-ntqry=><~]))'
  ].join('|'),
);

/// Removes any ANSI styling from any input.
String stripAnsi(String input) {
  return input.replaceAll(_stripRegex, '');
}