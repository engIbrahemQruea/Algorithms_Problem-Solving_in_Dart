import 'package:level5/models/project8/my_queue_line.dart';

void main() {
  final payBillsQueue = MyQueueLine(queueName: 'A0', averageServeTime: 10);
  final subscriptionQueue = MyQueueLine(queueName: 'B0', averageServeTime: 5);

  payBillsQueue.issueTicket();
  payBillsQueue.issueTicket();
  payBillsQueue.issueTicket();
  payBillsQueue.issueTicket();
  payBillsQueue.issueTicket();

  payBillsQueue.printInfo();
  payBillsQueue.printTicketsLineRTL();
  payBillsQueue.printTicketsLineLTR();
  payBillsQueue.printAllTickets();

  payBillsQueue.serveNextClient();
  print('Pay Bills Queue After Serving One client');
  payBillsQueue.printInfo();

  subscriptionQueue.issueTicket();
  subscriptionQueue.issueTicket();
  subscriptionQueue.issueTicket();
  subscriptionQueue.issueTicket();
  subscriptionQueue.printInfo();
  subscriptionQueue.printTicketsLineRTL();
  subscriptionQueue.printTicketsLineLTR();
  subscriptionQueue.printAllTickets();
  subscriptionQueue.serveNextClient();
  print('Subscription Queue After Serving One client');
  subscriptionQueue.printInfo();
}
