import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTransaction;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  NewTransaction(this._addTransaction);

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
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            FlatButton(
              onPressed: () {
                _addTransaction(_titleController.text,
                    double.parse(_amountController.text));
              },
              textColor: Colors.blue[400],
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
