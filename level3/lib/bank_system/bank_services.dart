import 'dart:io';

import 'package:level3/bank_system/bank_model.dart';
import 'package:level3/bank_system/bank_screen_utils.dart';
import 'package:level3/level3.dart';

const String clientFileName = 'MyClient.txt';



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