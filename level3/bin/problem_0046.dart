/// A class representing client data.
class ClsClientData {
  final String accountNumber;
  final String pinCode;
  final String name;
  final String phone;
  final double balance;

  ClsClientData({
    required this.accountNumber,
    required this.pinCode,
    required this.name,
    required this.phone,
    required this.balance,
  });

  factory ClsClientData.fromLine(
    String lineRecord, [
    String seperator = '#//#',
  ]) {
    if (lineRecord.isEmpty) {
      throw Exception('Line record is empty');
    }
    final List<String> lsParts = lineRecord.split(seperator);

    if (lsParts.length != 5) {
      throw FormatException('Invalid client record format');
    }

    return ClsClientData(
      accountNumber: lsParts[0],
      pinCode: lsParts[1],
      name: lsParts[2],
      phone: lsParts[3],
      balance: double.parse(lsParts[4]),
    );
  }
  void printClientRecord() {
    print("\nThe following is the extracted client record:\n");
    print("Accout Number   : $accountNumber");
    print("Pin Code        : $pinCode");
    print("Name            : $name");
    print("Phone           : $phone");
    print("Account Balance : $balance");
  }
}

void main() {
  String lineRecord =
      "A150#//#1234#//#Ibrahim Ahmed Salh Qurea#//#773635382#//#10000.00";

  print('Line Record is:\n $lineRecord');
  final client = ClsClientData.fromLine(lineRecord);

  client.printClientRecord();
}
