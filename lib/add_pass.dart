import 'dart:io';
import 'dart:convert';
import 'encryption.dart' as encrypt;

addPassword() {
  stdout.write("\nEnter account name: ");
  String? account = stdin.readLineSync();
  stdout.write("\nEnter password: ");
  String? password = stdin.readLineSync();

  if (account == null ||
      password == null ||
      account.isEmpty ||
      password.isEmpty) {
    print("❌ Account name or password cannot be empty.");
    return;
  }

  try {
    print("Writing data in file...");
    var fileName = File("data/passwords.json");
    Map<String, dynamic> passwords = {};

    if (fileName.existsSync()) {
      String fileContent = fileName.readAsStringSync();
      if (fileContent.isNotEmpty) {
        passwords = jsonDecode(fileContent);
      }
    }

    // Password encrypted here
    var encryptedPassword = encrypt.encryptPassword(password);
    print("🔐 Encrypted Password: $encryptedPassword"); // DEBUG

    passwords[account] = encryptedPassword;

    fileName.writeAsStringSync(jsonEncode(passwords));
    print("✅ Password saved successfully!");
  } catch (e) {
    print("An error occured: $e");
  }
}
