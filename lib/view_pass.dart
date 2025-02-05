import 'dart:convert';
import 'dart:io';
import 'encryption.dart' as enc;

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

  print("===== 🔐 Stored Passwords =====");
  passwords.forEach((key, value) {
    if (value != null && value.isNotEmpty) {
      // print("🔐 Stored Encrypted Password for $key: $value"); // DEBUG
      try {
        var pass = enc.decryptPassword(value);
        print("$key -> $pass");
      } catch (e) {
        print("❌ Error decrypting $key: $e");
      }
    } else {
      print("$key -> ❌ Unable to decrypt (Empty or Corrupt)");
    }
  });
}
