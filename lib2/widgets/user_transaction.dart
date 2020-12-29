import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_file.dart';
import "../models/transaction.dart";

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTrx = [
    Transaction("t1", "Shoe stand", 14.55, DateTime.now()),
    Transaction("t2", "White Bulbs", 55.55, DateTime.now()),
    Transaction("t3", "Graham Norton show tickets", 100, DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());

    setState(() {
      _userTrx.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTrx)
      ],
    );
  }
}
