import 'dart:io';
import 'dart:convert';

deletePass() {
  var fileName = File("data/passwords.json");
  Map<String, dynamic> passwords = {};

  if (fileName.existsSync()) {
    String fileContent = fileName.readAsStringSync();
    if (fileContent.isNotEmpty) {
      passwords = jsonDecode(fileContent);
    } else {
      stdout.write("\nNo passwords saved yet!");
      return;
    }
  }
  passwords.forEach(
    (key, value) => stdout.write("\n$key -> ****"),
  );
  stdout.write("\nSelect the account you want to remove: ");
  String? account = stdin.readLineSync();
  if (account == null || account.isEmpty) {
    stdout.write("\n❌ Account name cannot be empty.");
    return;
  }

  if (passwords.containsKey(account)) {
    stdout.write("\nContinue Removing $account? (y/n)");
    String? confirmation = stdin.readLineSync();
    if (confirmation != null &&
        (confirmation.toLowerCase() == "y" ||
            confirmation.toLowerCase() == "yes")) {
      passwords.remove(account);
      stdout.write("\n✅ Password for `$account` deleted successfully!");

      fileName.writeAsStringSync(jsonEncode(passwords));
    } else {
      stdout.write("\nConfirmation cancelled!");
      return;
    }
  } else {
    stdout.write("\n$account doesn't exist.");
    return;
  }
}
