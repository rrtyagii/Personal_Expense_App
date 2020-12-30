import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

import 'widgets/transaction_file.dart';
import 'widgets/new_transaction.dart';
import 'models/transaction.dart';

// import "package:intl/intl.dart";

// import 'models/trasaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue,
        fontFamily: "OpenSans",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontFamily: 'Quicksand', fontSize: 20)),
        ),
      ),
      //themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
    ); //MaterialApp
  }
}

class MyHomePage extends StatefulWidget {
  // final List<Transaction> trx = [
  //   Transaction("t1", "Shoe stand", 14.55, DateTime.now()),
  //   Transaction("t2", "White Bulbs", 55.55, DateTime.now()),
  //   Transaction("t3", "Graham Norton show tickets", 100, DateTime.now())
  // ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  String titleInput, amountInput;

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

  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_chart),
              onPressed: () => _startAddnewTransaction(context))
        ],
        title: Text(
          "Personal Expense",
          style: TextStyle(fontFamily: "Quicksand"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,  in a column, mainaxis is the y axis
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // crossaxis is the x axis in a column.
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("CHART!"),
                color: Colors.blueAccent,
                elevation: 5,
              ),
            ),
            TransactionList(_userTrx),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddnewTransaction(context),
      ),
    );
  }
}

// Card(
//   elevation: 5,
//   child: Container(
//     padding: EdgeInsets.all(15),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         TextField(
//           decoration: InputDecoration(labelText: "Title"),
//           onChanged: (value) {
//             titleInput = value;
//           },
//         ),
//         TextField(
//           decoration: InputDecoration(labelText: "Amount"),
//           onChanged: (value) {
//             amountInput = value;
//           },
//         ),
//         FlatButton(
//           onPressed: () {
//             print(titleInput);
//             print(amountInput);
//             print("Transaction added");
//           },
//           textColor: Colors.blue[400],
//           child: Text("Add Transaction"),
//         ),
//       ],
//     ),
//   ),
// ),
// Column(
//   children: trx.map((tx) {
//     return Card(
//       child: Row(
//         children: <Widget>[
//           Container(
//             margin:
//                 EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 width: 2,
//                 color: Colors.purpleAccent,
//               ),
//             ),
//             child: Text(
//               '\S${tx.getAmount()}', // + tx.getAmount().toString(),
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 tx.getTitle(),
//                 style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 DateFormat("MM-dd-yyyy").format(tx.getDate()),
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.blueGrey,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }).toList(),
// ),
