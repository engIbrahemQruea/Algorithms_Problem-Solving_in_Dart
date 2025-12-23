import 'dart:io';

String readPassword() {
  stdout.write("Please enter Text? ");
  String? password = stdin.readLineSync();
  return password!;
}

String encryptText(String text, int encryptionKey) {
  String result = '';
  for (int i = 0; i < text.length; i++) {
    result += String.fromCharCode(text.codeUnitAt(i) + encryptionKey);
  }
  return result;
}
String decryptText(String text, int encryptionKey) {
  String result = '';
  for (int i = 0; i < text.length; i++) {
    result += String.fromCharCode(text.codeUnitAt(i) - encryptionKey);
  }
  return result;
}
void main() {
  const int encryptionKey = 2;
  String textAfterEncryption, textAfterDecryption, textBeforEncryption;
  textBeforEncryption = readPassword();
  textAfterEncryption = encryptText(textBeforEncryption, encryptionKey);
  textAfterDecryption = decryptText(textAfterEncryption, encryptionKey);
  print("Text Before Encryption : $textBeforEncryption ");
  print('Text After Encryption :$textAfterEncryption');
  print('Text After Decryption :$textAfterDecryption');
}
