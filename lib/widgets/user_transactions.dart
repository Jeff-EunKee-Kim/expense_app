import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 40.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "New Car",
      amount: 20.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransactions(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransactions),
        TransactionList(_userTransactions),
      ],
    );
  }
}
