void main() {
  int input = 1002; // change this number for testing
  print(numberToWords(input));
}

String numberToWords(int number) {
  if (number == 0) return "zero";

  return [
    if ((number ~/ 1000000) > 0) "${convertThreeDigits(number ~/ 1000000)} million",
    if (((number ~/ 1000) % 1000) > 0) "${convertThreeDigits((number ~/ 1000) % 1000)} thousand",
    if ((number % 1000) > 0) convertThreeDigits(number % 1000),
  ].join(" ").trim();
}

String convertThreeDigits(int num) {
  if (num == 0) return "";

  if (num < 100) return convertTwoDigits(num);

  int hundreds = num ~/ 100;
  int rest = num % 100;

  return [
    "${units[hundreds]} hundred",
    if (rest > 0) convertTwoDigits(rest),
  ].join(" ");
}

String convertTwoDigits(int num) {
  if (num < 10) return units[num];
  if (num < 20) return teens[num - 10];

  int tensPlace = num ~/ 10;
  int onesPlace = num % 10;

  return [
    tens[tensPlace],
    if (onesPlace > 0) units[onesPlace]
  ].join(" ");
}

final List<String> units = [
  "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
];

final List<String> teens = [
  "ten", "eleven", "twelve", "thirteen", "fourteen",
  "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
];

final List<String> tens = [
  "", "", "twenty", "thirty", "forty", "fifty",
  "sixty", "seventy", "eighty", "ninety"
];