import 'dart:io';

import 'package:level3/level3.dart';

/// Reverses the order of words in the given [input] string.
String reverseWords(String input) {
  final words = input.trim().split(RegExp(r'\s+'));
  return words.reversed.join(' ');
}

void main() {
  final input = readString(message: 'Please Enter a String: ');
  stdout.write(reverseWords(input));

  /// Reverses each word in the given [input] string.
  final result = input
      .trim()
      .split(RegExp(r'\s+'))
      .map((word) => word.split('').reversed.join())
      .join(' ');
  stdout.write('\nReversed Each Word: $result');
}
