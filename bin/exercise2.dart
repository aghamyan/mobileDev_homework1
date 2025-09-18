void main() {
  final data = [
    1,
    [2, 3, 4],
    {'a': 5, 'b': ["ab", 7]},
    {'first': 8, 'second': "c"},
    {'c': {'first': 10, 'second': ["xy", 12]}},
    "z",
    13.5,
    [14, {'d': 15, 'e': {'first': "p", 'second': 17}}],
  ];

  final result = NestedSum(data);
  print("Sum: $result");
}

int sumSpecialList(List<dynamic> list) {
  int total = 0;
  for (final element in list) {
    total += NestedSum(element);
  }
  return total;
}
int sumAscii(String s) {
  int total = 0;
  for (final rune in s.runes) {
    total += rune; // ASCII value
  }
  return total;
}
int NestedSum(dynamic object) {
  switch (object) {
    case int n:
      return n;

    case double d:
      return d.floor();

    case String s:
      return sumAscii(s);

    case List<dynamic> l:
      return sumSpecialList(l);

    case Map<dynamic, dynamic> m:
      if (m.containsKey('first') && m.containsKey('second')) {
        return NestedSum(m['first']) + NestedSum(m['second']);
      }
      int total = 0;
      for (final value in m.values) {
        total += NestedSum(value);
      }
      return total;

    case (var a, var b): // ✅ Positional record
      return NestedSum(a) + NestedSum(b);
    default:
      return 0;
  }
}
