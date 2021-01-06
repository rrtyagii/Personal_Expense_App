import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;
  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submissionForData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget._addTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _pickDatefromDatePicker() {
    //List<>
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); // The code execution will not pause and wait for
  } // the function in the then app to finish

//the function we pass here is stored in memory and the other

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => _submissionForData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submissionForData(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "No Date Chosen"
                        : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}",
                  ),
                ),
                FlatButton(
                  textColor: Theme.of(context).accentColor,
                  child: Text(
                    "Choose Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _pickDatefromDatePicker,
                ),
              ],
            ),
            RaisedButton(
              onPressed: _submissionForData,
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).accentColor,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row(
//   children: <Widget>[
//     Text("No Date Chosen"),
//     RaisedButton(
//       textColor: Theme.of(context).primaryColor,
//       child: Container(
//         padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: Theme.of(context).accentColor,
//         ),
//         child: Text("Choose Date"),
//       ),
//       onPressed: () {},
//     ),
//   ],
// ),
// RaisedButton(
//   onPressed: _submissionForData,
//   textColor: Theme.of(context).primaryColor,
//   child: Container(
//     padding: EdgeInsets.all(5),
//     decoration: BoxDecoration(
//       color: Theme.of(context).accentColor,
//     ),
//     child: Text(
//       "Add Transaction",
//     ),
//   ),
// )
