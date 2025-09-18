int calculate() {
  final data = [
    1,                                        // 1
    [2, 3, 4],                                // 9
    {'a': 5, 'b': ["ab", 7]},                 // 207
    {'first': 8, 'second': "c"},             // 8 + 99 = 107
    {'c': {'first': 10, 'second': ["xy", 12]}}, // 263
    "z",                                      // 122
    13.5,                                     // 13
    [14, {'d': 15, 'e': {'first': "p", 'second': 17}}],
  ];

  return sumNested(data);
}

int sumNested(dynamic obj) {
  switch (obj) {
    case int n:
      return n;

    case double d:
      return d.floor();

    case String s:
      return sumAscii(s);

    case List<dynamic> l:
      return sumSpecialList(l);

    case Map<dynamic, dynamic> m:
    // Simulate named record: check for 'first' and 'second'
      if (m.containsKey('first') && m.containsKey('second')) {
        return sumNested(m['first']) + sumNested(m['second']);
      }

      // Sum all values in map (ignore keys)
      int sum = 0;
      for (final value in m.values) {
        sum += sumNested(value);
      }
      return sum;

    case (var a, var b): // Positional record
      return sumNested(a) + sumNested(b);

    default:
      return 0;
  }
}

int sumAscii(String s) {
  int total = 0;
  for (final rune in s.runes) {
    total += rune;
  }
  return total;
}

int sumSpecialList(List<dynamic> list) {
  int total = 0;
  for (final element in list) {
    total += sumNested(element);
  }
  return total;
}

void main() {
  print(calculate());
}