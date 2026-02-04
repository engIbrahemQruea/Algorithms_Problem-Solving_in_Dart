import 'dart:io';

import 'package:level3/bank_system/bank_logic.dart';
import 'package:level3/bank_system/bank_model.dart';
import 'package:level3/level3.dart';

EnMenuOptions readMenu(int numberMenu) {
  return EnMenuOptions.values[numberMenu - 1];
}

bool confirmAction(String message) {
  final String answer = readString(message: "$message (y/n)? ");
  return answer.trim().toUpperCase() == 'Y';
}

void printHeaderAllScreens(String title) {
  print('=' * 50);
  print('\t\t$title Screen');
  print('=' * 50);
}

void printClientCard(ClsClient client) {
  print("\n========================================");
  print("        CLIENT DETAILS CARD             ");
  print("========================================");
  print("  Account Number   : ${client.accountNumber}");
  print("  Pin Code         : ${client.pinCode}");
  print("  Client Name      : ${client.name}");
  print("  Phone            : ${client.phoneNumber}");
  print("  Account Balance  : ${client.balance.toStringAsFixed(2)} \$");
  print("========================================\n");
}

void printGetAllClientsData(List<ClsClient> clients) {
  const accLen = 15, pinLen = 10, nameLen = 20, phoneLen = 12, balLen = 12;
  final String separator =
      "—" * (accLen + pinLen + nameLen + phoneLen + balLen + 16);

  print("\n\t\t\t\t  Client List (${clients.length}) Client(s).");
  print(separator);

  print(
    "| ${"Account Number".padRight(accLen)} "
    "| ${"Pin Code".padRight(pinLen)} "
    "| ${"Client Name".padRight(nameLen)} "
    "| ${"Phone".padRight(phoneLen)} "
    "| ${"Balance".padRight(balLen)} |",
  );
  print(separator);

  if (clients.isEmpty) {
    print("\t\t\t\t  No Clients Available In the System!");
  } else {
    for (var client in clients) {
      print(
        "| ${client.accountNumber.padRight(accLen)} "
        "| ${client.pinCode.padRight(pinLen)} "
        "| ${client.name.padRight(nameLen)} "
        "| ${client.phoneNumber.padRight(phoneLen)} "
        "| ${client.balance.toStringAsFixed(2).padRight(balLen)} |",
      );
    }
  }

  print("$separator\n");
}

void goBackToMainMenu() {
  if (confirmAction('Do you want to go back to Main Menu?')) {
    showMainMenuScreen();
  } else {
    print('Exiting the program. Goodbye!');
    exit(0);
  }
}

void showSelectedScreen() async {
  int readNumber = readPositiveNumber(
    'Choose what do you want to do? [1 to 6]?',
  );
  switch (readMenu(readNumber)) {
    case EnMenuOptions.showClient:
      getAllClients();
      goBackToMainMenu();
      break;
    case EnMenuOptions.addClient:
      addNewClients();
      goBackToMainMenu();
      break;
    case EnMenuOptions.deleteClient:
      deleteClients();
      goBackToMainMenu();
      break;
    case EnMenuOptions.updateClient:
      await updateClients();
      goBackToMainMenu();
      break;
    case EnMenuOptions.findClient:
      findClient();
      goBackToMainMenu();
      break;
    case EnMenuOptions.exit:
      print('Exiting the program. Goodbye!');
      exit(0);
  }
}

void showMainMenuScreen() {
  print('=' * 50);
  print('\t\tMain Menue Screen');
  print('=' * 50);
  print('[1] Show Client List.');
  print('[2] Add New Client.');
  print('[3] Delete Client.');
  print('[4] Update Client Info.');
  print('[5] Find Client.');
  print('[6] Exit.');
  print('=' * 50);
  showSelectedScreen();
}
