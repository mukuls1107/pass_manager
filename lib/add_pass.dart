import 'dart:io';
import 'dart:convert';

addPassword() {
  print("Enter account name: ");
  String? account = stdin.readLineSync();
  print("Enter password: ");
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
    var fileName = File("passwords.json");
    Map<String, dynamic> passwords = {};

    if (fileName.existsSync()) {
      String fileContent = fileName.readAsStringSync();
      if (fileContent.isNotEmpty) {
        passwords = jsonDecode(fileContent);
      }
    }

    passwords[account] = password;

    fileName.writeAsStringSync(jsonEncode(passwords));
    print("✅ Password saved successfully!");
  } catch (e) {
    print("An error occured: $e");
  }
}
