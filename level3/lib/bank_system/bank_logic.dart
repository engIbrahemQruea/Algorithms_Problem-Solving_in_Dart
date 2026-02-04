import 'package:level3/bank_system/bank_model.dart';
import 'package:level3/bank_system/bank_screen_utils.dart';
import 'package:level3/bank_system/bank_services.dart';
import 'package:level3/level3.dart';

void findClient() {
  printHeaderAllScreens('Find Client Screen ');

  final String searchID = readString(message: 'Please Enter accountNumber ? ');
  final client = findClientByAccountNumber(searchID);

  if (client != null) {
    printClientCard(client);
  } else {
    print("\n❌ Client with Account Number [$searchID] is NOT found!");
  }
}

Future<void> updateClientByAccountNumber(String searchID) async {
  final clientData = loadDataFromFile();
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

Future<void> updateClients() async {
  printHeaderAllScreens('Update Client Screen ');

  final String searchID = readString(message: 'Please Enter accountNumber ? ');
  await updateClientByAccountNumber(searchID);
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

void deleteClients() {
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
    printHeaderAllScreens('Add New Client Screen ');
    await addNewClient();

    tryAgain = confirmAction('Do you want to add more clients?');
  }
  print('\n🏁 All operations completed.');
}






void getAllClients() {
  final clients = loadDataFromFile();
  printGetAllClientsData(clients);
}