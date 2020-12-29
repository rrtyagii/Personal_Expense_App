import 'package:flutter/foundation.dart';

class Transaction {
  final String _id;
  final String _title;
  final double _amount;
  final DateTime _date;

  Transaction(@required this._id, @required this._title, @required this._amount,
      @required this._date);

  String getId() {
    return this._id;
  }

  String getTitle() {
    return this._title;
  }

  double getAmount() {
    return this._amount;
  }

  DateTime getDate() {
    return this._date;
  }
}

//lib2\models\transaction.dart
