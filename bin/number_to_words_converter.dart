void main() {
  int input = 1002;
  print(numberToWords(input));
}

String numberToWords(int number) {
  if (number == 0) return "zero";

  return [
    if ((number ~/ 1000000) > 0) "${ThreeDigits(number ~/ 1000000)} million",
    if (((number ~/ 1000) % 1000) > 0) "${ThreeDigits((number ~/ 1000) % 1000)} thousand",
    if ((number % 1000) > 0) ThreeDigits(number % 1000),
  ].join(" ").trim();
}

String ThreeDigits(int num) {
  if (num == 0) return "";

  if (num < 100) return TwoDigits(num);

  int hundreds = num ~/ 100;
  int rest = num % 100;

  return [
    "${OneToTen[hundreds]} hundred",
    if (rest > 0) TwoDigits(rest),
  ].join(" ");
}

String TwoDigits(int num) {
  if (num < 10) return OneToTen[num];
  if (num < 20) return Tens[num - 10];

  int tensPlace = num ~/ 10;
  int onesPlace = num % 10;

  return [
    Tens[tensPlace],
    if (onesPlace > 0) OneToTen[onesPlace]
  ].join(" ");
}

final List<String> OneToTen = [
  "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
];

final List<String> TentoTweny = [
  "ten", "eleven", "twelve", "thirteen", "fourteen",
  "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
];

final List<String> Tens = [
  "", "", "twenty", "thirty", "forty", "fifty",
  "sixty", "seventy", "eighty", "ninety"
];