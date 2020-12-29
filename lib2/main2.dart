import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

import 'widgets/user_transaction.dart';

// import "package:intl/intl.dart";

// import 'models/trasaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: MyHomePage(),
    ); //MaterialApp
  }
}

class MyHomePage extends StatelessWidget {
  // final List<Transaction> trx = [
  //   Transaction("t1", "Shoe stand", 14.55, DateTime.now()),
  //   Transaction("t2", "White Bulbs", 55.55, DateTime.now()),
  //   Transaction("t3", "Graham Norton show tickets", 100, DateTime.now())
  // ];

  String titleInput, amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter App"),
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
            UserTransaction(),
          ],
        ),
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
