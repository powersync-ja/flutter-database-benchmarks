const digits = [
  '',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine'
];
final List<String> names100 = [
  ...digits,
  ...[
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
  ],
  ...digits.map((digit) => 'twenty${digit != '' ? '-' + digit : ''}'),
  ...digits.map((digit) => 'thirty${digit != '' ? '-' + digit : ''}'),
  ...digits.map((digit) => 'forty${digit != '' ? '-' + digit : ''}'),
  ...digits.map((digit) => 'fifty${digit != '' ? '-' + digit : ''}'),
  ...digits.map((digit) => 'sixty${digit != '' ? '-' + digit : ''}'),
  ...digits.map((digit) => 'seventy${digit != '' ? '-' + digit : ''}'),
  ...digits.map((digit) => 'eighty${digit != '' ? '-' + digit : ''}'),
  ...digits.map((digit) => 'ninety${digit != '' ? '-' + digit : ''}'),
];

String numberName(int n) {
  if (n == 0) {
    return 'zero';
  }

  List<String> name = [];
  final d43 = (n / 1000).floor();
  if (d43 != 0) {
    name.add(names100[d43]);
    name.add('thousand');
    n -= d43 * 1000;
  }

  final d2 = (n / 100).floor();
  if (d2 != 0) {
    name.add(names100[d2]);
    name.add('hundred');
    n -= d2 * 100;
  }

  final d10 = n;
  if (d10 != 0) {
    name.add(names100[d10]);
  }

  return name.join(' ');
}

void assertAlways(bool condition) {
  if (!condition) {
    throw AssertionError('Assertion failed');
  }
}
