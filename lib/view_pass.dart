import 'dart:convert';
import 'dart:io';

viewPasswords() {
  var fileName = File("data/passwords.json");
  Map<String, dynamic> passwords = {};

  if (fileName.existsSync()) {
    String fileContent = fileName.readAsStringSync();
    if (fileContent.isNotEmpty) {
      passwords = jsonDecode(fileContent);
    } else {
      print("No passwords saved yet!");
      return;
    }
  }
  print("===== Stored Passwords =====");
  passwords.forEach((key, value) {
    print("$key -> $value");
  });
}
