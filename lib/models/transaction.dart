class Transaction {
  final String _id;
  final String _title;
  final double _amount;
  final DateTime _date;

  Transaction(this._id, this._title, this._amount, this._date);

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
