import 'dart:io';

import 'package:level3/level3.dart';

const String clientFileName = 'MyClient.txt';

enum EnMenuOptions {
  showClient,
  addClient,
  deleteClient,
  updateClient,
  findClient,
  transactions,
  exit,
}

class ClsClient {
  final String accountNumber;
  final String pinCode;
  final String name;
  final String phoneNumber;
  final double balance;

  ClsClient({
    required this.accountNumber,
    required this.pinCode,
    required this.name,
    required this.phoneNumber,
    required this.balance,
  });

  factory ClsClient.fromLine(String lineRecord, [String separator = '#//#']) {
    final List<String> parts = lineRecord.split(separator);
    if (parts.length < 5) throw FormatException('Invalid record format');

    return ClsClient(
      accountNumber: parts[0],
      pinCode: parts[1],
      name: parts[2],
      phoneNumber: parts[3],
      balance: double.tryParse(parts[4]) ?? 0.0,
    );
  }

  String toLine({String separator = '#//#'}) {
    return [
      accountNumber,
      pinCode,
      name,
      phoneNumber,
      balance.toStringAsFixed(2),
    ].join(separator);
  }

  static ClsClient clientInputService(String accountNumber) {
    return ClsClient(
      accountNumber: accountNumber,
      pinCode: readString(message: 'Enter Pin Code? '),
      name: readString(message: 'Enter Name? '),
      phoneNumber: readString(message: 'Enter Phone? '),
      balance: readPositiveNumber('Enter Account Balance? ').toDouble(),
    );
  }

  static ClsClient clientTransactionsService(
    ClsClient client, [
    bool isWithdraw = false,
  ]) {
    return ClsClient(
      accountNumber: client.accountNumber,
      pinCode: client.pinCode,
      name: client.name,
      phoneNumber: client.phoneNumber,
      balance: calcTransactionOperations(
        client.balance,
        isWithdraw: isWithdraw,
      ),
    );
  }
}

List<ClsClient> loadDataFromFile() {
  final file = File(clientFileName);
  if (!file.existsSync()) return [];

  try {
    return file
        .readAsLinesSync()
        .where((line) => line.trim().isNotEmpty)
        .map((line) => ClsClient.fromLine(line))
        .toList();
  } catch (e) {
    print('Error reading file: $e');
    return [];
  }
}

EnMenuOptions readMainMenuOption(int numberMenu) {
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

/// Start Find Client  ///

void showFindClientScreen() {
  printHeaderAllScreens('Find Client Screen ');

  final String searchID = readString(message: 'Please Enter accountNumber ? ');
  final clientData = loadDataFromFile();
  final client = findClientByAccountNumber(searchID, clientData);

  if (client != null) {
    printClientCard(client);
  } else {
    print("\n❌ Client with Account Number [$searchID] is NOT found!");
  }
}

/// End Find Client  ///

/// Start Update Client ///

Future<void> updateClientByAccountNumber(
  List<ClsClient> clientData,
  String searchID,
) async {
  final client = findClientByAccountNumber(searchID, clientData);

  if (client != null) {
    final index = clientData.indexOf(client);
    printClientCard(client);
    if (confirmAction("Are you sure you want to update this client?")) {
      clientData[index] = ClsClient.clientInputService(searchID);
      await saveAllClientsToFile(clientData);
      print('Client Updated [${clientData[index].name}] Successfully.');
    } else {
      print('Update Operation Cancelled.');
    }
  } else {
    print("\n❌ Client with Account Number [$searchID] is NOT found!");
  }
}

Future<void> showUpdateClientsScreen() async {
  printHeaderAllScreens('Update Client Screen ');
  final clientData = loadDataFromFile();
  final String searchID = readString(message: 'Please Enter accountNumber ? ');
  await updateClientByAccountNumber(clientData, searchID);
}

/// End Update Client ///

/// Start Delete Client ///

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

Future<void> saveAllClientsToFile(List<ClsClient> clients) async {
  try {
    final file = File(clientFileName);
    String allData = clients.map((c) => c.toLine()).join('\n');

    if (allData.isNotEmpty) allData += '\n';
    await file.writeAsString(allData);
  } catch (e) {
    stderr.writeln('Critical Error: Could not refresh file. Details: $e');
  }
}

void deleteClientByAccountNumber(List<ClsClient> clientData) async {
  final String searchID = readString(message: 'Please Enter accountNumber ? ');
  final client = findClientByAccountNumber(searchID);

  if (client != null) {
    printClientCard(client);
    if (confirmAction("Are you sure you want to delete this client?")) {
      clientData.removeWhere((element) => element.accountNumber == searchID);
      await saveAllClientsToFile(clientData);
      print('Client Deleted Successfully.');
    } else {
      print('Delete Operation Cancelled.');
    }
  } else {
    print("\n❌ Client with Account Number [$searchID] is NOT found!");
  }
}

void showDeleteClientScreen() {
  printHeaderAllScreens('Delete Client Screen ');
  final clientData = loadDataFromFile();
  deleteClientByAccountNumber(clientData);
}

/// End Delete Client ///

ClsClient? findClientByAccountNumber(
  String accountNumber, [
  List<ClsClient>? client,
]) {
  final clientData = client ?? loadDataFromFile();

  try {
    return clientData.firstWhere(
      (c) =>
          c.accountNumber.trim().toUpperCase() ==
          accountNumber.trim().toUpperCase(),
    );
  } catch (e) {
    return null;
  }
}

Future<bool> saveDataToFile(String lineData) async {
  try {
    final file = File(clientFileName);

    await file.writeAsString('$lineData\n', mode: FileMode.append, flush: true);
    return true;
  } catch (e) {
    stderr.writeln(
      'Critical Error: Could not save to $clientFileName. Details: $e',
    );
    return false;
  }
}

String checkAccountNumberExists() {
  String accountNumber = readString(message: 'Enter Account Number to check? ');

  while (findClientByAccountNumber(accountNumber) != null) {
    accountNumber = readString(
      message:
          'Client with [$accountNumber] already exists. Enter a different Account Number? ',
    );
  }
  return accountNumber;
}

ClsClient readNewClient() {
  print('Adding New Client ');
  return ClsClient(
    accountNumber: checkAccountNumberExists(),
    pinCode: readString(message: 'Enter Pin Code? '),
    name: readString(message: 'Enter Name? '),
    phoneNumber: readString(message: 'Enter Phone? '),
    balance: readPositiveNumber('Enter Account Balance? ').toDouble(),
  );
}

Future<void> addNewClient() async {
  final client = readNewClient();
  final isSaved = await saveDataToFile(client.toLine());

  if (isSaved) {
    print('✅ Client [${client.accountNumber}] saved successfully.');
  } else {
    print('❌ Failed to save client.');
  }
}

void addNewClients() async {
  bool tryAgain = true;
  while (tryAgain) {
    await addNewClient();
    tryAgain = confirmAction('Do you want to add more clients?');
  }
  print('\n🏁 All operations completed.');
}

void showAddNewClientsScreen() {
  printHeaderAllScreens('Add New Client Screen ');
  addNewClients();
}

/// End Add New Client ///

/// Start Show All Clients ///

void printAllClientsInfo(List<ClsClient> clients) {
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

void showAllClientsScreen() {
  final clients = loadDataFromFile();
  printAllClientsInfo(clients);
}

///  End Show All Clients ///

/// Start Total Balance Screen ///

void printTotalBalanceClientsInfo(List<ClsClient> clients) {
  const accLen = 15, nameLen = 20, balLen = 12;
  final String separator = "—" * (accLen + nameLen + balLen + 16);

  print("\n\t\t\t\t  Balance List (${clients.length}) Client(s).");
  print(separator);

  print(
    "| ${"Account Number".padRight(accLen)} "
    "| ${"Client Name".padRight(nameLen)} "
    "| ${"Balance".padRight(balLen)} |",
  );
  print(separator);

  if (clients.isEmpty) {
    print("\t\t\t\t  No Clients Available In the System!");
  } else {
    for (var client in clients) {
      print(
        "| ${client.accountNumber.padRight(accLen)} "
        "| ${client.name.padRight(nameLen)} "
        "| ${client.balance.toStringAsFixed(2).padRight(balLen)} |",
      );
    }
  }

  print("$separator\n");
}

Future<void> showTotalBalanceScreen() async {
  final clients = loadDataFromFile();
  printTotalBalanceClientsInfo(clients);
  double totalBalance = clients.fold(
    0.0,
    (sum, client) => sum + client.balance,
  );
  print('\t  Total Balance of All Clients is: $totalBalance \$');
}

/// End Total Balance Screen ///

/// Start Withdraw Screen ///

Future<void> withdrawClientByAccountNumber(
  List<ClsClient> clientData,
  String searchID,
) async {
  final client = findClientByAccountNumber(searchID, clientData);

  if (client != null) {
    final index = clientData.indexOf(client);
    printClientCard(client);
    clientData[index] = ClsClient.clientTransactionsService(client, true);
    if (confirmAction("Are you sure you want to perform this transaction?")) {
      await saveAllClientsToFile(clientData);
      print(
        '✅ Withdraw Done Successfully New Balance is : [${clientData[index].balance}] .',
      );
    } else {
      print('❌ Withdraw Operation Cancelled.');
    }
  }
}

Future<void> showWithdrawScreen() async {
  printHeaderAllScreens('Withdraw Screen');
  final client = loadDataFromFile();
  final searchID = checkAccountNumberExistsToDeposit();
  await withdrawClientByAccountNumber(client, searchID);
}

/// End Withdraw Screen ///

/// Start Deposit Screen ///

Future<void> depositClientByAccountNumber(
  List<ClsClient> clientData,
  String searchID,
) async {
  final client = findClientByAccountNumber(searchID, clientData);

  if (client != null) {
    final index = clientData.indexOf(client);
    printClientCard(client);
    clientData[index] = ClsClient.clientTransactionsService(client);
    if (confirmAction("Are you sure you want to perform this transaction?")) {
      await saveAllClientsToFile(clientData);
      print(
        '✅Deposit Done Successfully New Balance is : [${clientData[index].balance}] .',
      );
    } else {
      print('❌ Deposit Operation Cancelled.');
    }
  }
}

double calcTransactionOperations(
  double currentBalance, {
  bool isWithdraw = false,
}) {
  if (isWithdraw) {
    double withdrawAmount = readPositiveNumber(
      'Enter Amount to Withdraw Balance? ',
    ).toDouble();
    while (withdrawAmount > currentBalance) {
      print(
        '❌ Insufficient balance. Your current balance is ${currentBalance.toStringAsFixed(2)} \$',
      );
      withdrawAmount = readPositiveNumber(
        'Enter a valid Amount to Withdraw? ',
      ).toDouble();
    }
    return currentBalance - withdrawAmount;
  }
  return readPositiveNumber('Enter Amount to Deposit Balance? ') +
      currentBalance;
}

String checkAccountNumberExistsToDeposit() {
  String accountNumber = readString(message: 'Enter Account Number to check? ');

  while (findClientByAccountNumber(accountNumber) == null) {
    accountNumber = readString(
      message:
          'Client with [$accountNumber] does not exists. Please Enter   Account Number? ',
    );
  }
  return accountNumber;
}

Future<void> showDepositScreen() async {
  printHeaderAllScreens('Deposit Screen');
  final client = loadDataFromFile();
  final searchID = checkAccountNumberExistsToDeposit();
  await depositClientByAccountNumber(client, searchID);
}

/// End Deposit Screen ///

/// Transactions Screen ///

enum EnTransactionsMenu { deposit, withdraw, totalBalance, mainMenu }

EnTransactionsMenu readTransactionOption(int choice) {
  return EnTransactionsMenu.values[choice - 1];
}

Future<void> performTransactionsMenuOptions() async {
  int choice = readPositiveNumber('Choose what do you want to do? [1 to 4]?');
  switch (readTransactionOption(choice)) {
    case EnTransactionsMenu.deposit:
      await showDepositScreen();
      break;
    case EnTransactionsMenu.withdraw:
      await showWithdrawScreen();
      break;
    case EnTransactionsMenu.totalBalance:
      await showTotalBalanceScreen();
      break;

    default:
  }
}

Future<void> showTransactionsMenuScreen() async {
  printHeaderAllScreens('Transaction Menu Screen');
  print('[1] Deposit.');
  print('[2] Withdraw.');
  print('[3] Total Balance.');
  print('[4] Main Menu.');
  await performTransactionsMenuOptions();
}

/// Working

Future<bool> performMainMenuOption(
  bool keepRunning,
  int readNumberChoice,
) async {
  switch (readMainMenuOption(readNumberChoice)) {
    case EnMenuOptions.showClient:
      showAllClientsScreen();
      break;
    case EnMenuOptions.addClient:
      showAddNewClientsScreen();
      break;
    case EnMenuOptions.deleteClient:
      showDeleteClientScreen();
      break;
    case EnMenuOptions.updateClient:
      showUpdateClientsScreen();
      break;
    case EnMenuOptions.findClient:
      showFindClientScreen();
      break;
    case EnMenuOptions.transactions:
      await showTransactionsMenuScreen();
      break;
    case EnMenuOptions.exit:
      keepRunning = false;
      break;
  }
  return keepRunning;
}

void showMainMenuScreen() {
  printHeaderAllScreens('Main Menu Screen');
  print('[1] Show Client List.');
  print('[2] Add New Client.');
  print('[3] Delete Client.');
  print('[4] Update Client Info.');
  print('[5] Find Client.');
  print('[6] Transactions.');
  print('[7] Exit.');
  print('=' * 50);
}

void start() async {
  bool continueRunning = true;

  while (continueRunning) {
    showMainMenuScreen();
    int choice = readPositiveNumber('Choose what do you want to do? [1 to 7]?');
    if (choice < 1 || choice > 7) {
      print('❌ Invalid choice! Please try again.');
      continue;
    }
    continueRunning = await performMainMenuOption(continueRunning, choice);
    if (continueRunning) {
      if (!confirmAction('\nDo you want to go back to Main Menu?')) {
        continueRunning = false;
        print('Exiting... Goodbye!');
      }
    }
  }
}

void main() {
  start();
}
