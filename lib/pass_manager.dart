import 'dart:io';
import 'add_pass.dart';

void displayMenu() {
  while (true) {
    // Keep looping until the user chooses to exit
    print("\n===== Password Manager =====");
    print("1. Add a password");
    print("2. View passwords");
    print("3. Delete a password");
    print("4. Exit");
    print("Choose an option:");

    String? userChoice = stdin.readLineSync();
    int? choice = int.tryParse(userChoice ?? '');

    if (choice != null) {
      switch (choice) {
        case 1:
          print("You chose to add a password.");
          addPassword();
          break;
        case 2:
          print("You chose to view passwords.");
          break;
        case 3:
          print("You chose to delete a password.");
          break;
        case 4:
          print("Exiting program... Goodbye!");
          return; // Exits the function and stops the loop
        default:
          print("Unknown choice. Please enter a valid option.");
      }
    } else {
      print("Invalid input. Please enter a number.");
    }
  }
}
