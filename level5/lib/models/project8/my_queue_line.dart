// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';
import 'dart:io';

import 'package:level5/models/project8/extension_date_time.dart';

class Ticket {
  final int number;
  final String prefix;
  final DateTime ticketTime;
  final int waitingClients;
  final int averageServeTime;
  final int _expectedServeTime = 0;

  Ticket({
    required this.number,
    required this.prefix,
    required this.ticketTime,
    required this.waitingClients,
    required this.averageServeTime,
  });

  String fullNumber() => '$prefix$number';

  int expectedServeTime() => waitingClients * averageServeTime;

  void printTicket() {
    print(" _______________________");
    print(fullNumber());
    print(ticketTime.format12Hour());
    print(waitingClients);
    print(expectedServeTime());
    print(" _______________________");
  }
}

class MyQueueLine {
  final String queueName;
  final int averageServeTime;
  final _queue = Queue<Ticket>();
  int _totalTicket = 0;

  MyQueueLine({required this.queueName, required this.averageServeTime});

  int get _size => _queue.length;

  void issueTicket() {
    _totalTicket++;
    final ticket = Ticket(
      number: _totalTicket,
      prefix: queueName,
      ticketTime: DateTime.now(),
      waitingClients: waitingClients(),
      averageServeTime: averageServeTime,
    );
    _queue.add(ticket);
  }

  int waitingClients() {
    return _size;
  }

  String whoIsNext() {
    return _queue.isEmpty ? 'No Clients Left.' : _queue.first.fullNumber();
  }

  bool serveNextClient() {
    if (_queue.isEmpty) {
      return false;
    }
    _queue.removeFirst();
    return true;
  }

  int servedClients() => _totalTicket - waitingClients();

  void printInfo() {
    print('Pay Bills Queue Info:');
    print('-' * 20);
    print('Queue Info');
    print('-' * 20);
    print('Prefix       = ${_queue.first.prefix}');
    print('Total Ticket = $_size');
    print('Served Clients = ${servedClients()}');
    print('Waiting Clients = ${waitingClients()}');
  }

  void printTicketsLineRTL() {
    stdout.write('Tickets: ');
    for (var ticketInfo in _queue) {
      stdout.write('${ticketInfo.fullNumber()} ' + '<- ');
    }
    print('');
  }

  void printTicketsLineLTR() {
    stdout.write('Tickets: ');
    final tempQueue = _queue
        .map((tick) => tick.fullNumber())
        .toList()
        .reversed
        .toList();
    for (var ticketInfo in tempQueue) {
      stdout.write(
        '$ticketInfo '
        '-> ',
      );
    }
    print('');
  }

  void printAllTickets() {
    print('\n--- Current Active Tickets ---');
    if (_queue.isEmpty) {
      print('--- No Tickets in Queue ---');
      return;
    }
    for (var ticket in _queue) {
      ticket.printTicket();
    }
  }
}
