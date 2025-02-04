import 'dart:convert';
import 'dart:io';

viewPasswords() {
  print("\nStored Passwords:");
  var fileName = File("data/passwords.json");
  Map<String, dynamic> passwords = {};

  if (fileName.existsSync()) {
    String fileContent = fileName.readAsStringSync();
    if (fileContent.isNotEmpty) {
      passwords = jsonDecode(fileContent);
    }
  }

  passwords.forEach((key, value) {
    print("$key -> $value");
  });
}
