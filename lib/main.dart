import 'package:budgetApp/widgets/chart.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:flutter/cupertino.dart";

import './widgets/transaction_file.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import "./widgets/chart.dart";

// import "package:intl/intl.dart";

// import 'models/trasaction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );  This code snippet is to lock the device orientation to portait mode
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
        errorColor: Colors.grey[700],
        fontFamily: "OpenSans",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline3: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
        ),
      ),
      //themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
    ); //MaterialApp
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTrx = [];
  bool _showChart = false;

  List<Transaction> get _weeklyTransactions {
    return _userTrx.where((element) {
      return element.getDate().isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      DateTime.now().toString(),
      title,
      amount,
      chosenDate,
    );

    setState(() {
      _userTrx.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTrx.removeWhere((element) {
        return element.getId() == id;
      });
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
    final mediaQuery = MediaQuery.of(context);

    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    //storing appBar is a varialbe to access different properties like height
    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add_chart),
            onPressed: () => _startAddnewTransaction(context))
      ],
      title: Text(
        "Personal Expense",
        style: TextStyle(
          fontFamily: "Quicksand",
          fontWeight: FontWeight.bold,
        ),
      ),
    );

//storing transaction lists height on screen using container
    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.6,
      child: TransactionList(_userTrx, _deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,  in a column, mainaxis is the y axis
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // crossaxis is the x axis in a column.
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) {
                      setState(
                        () {
                          _showChart = val;
                        },
                      );
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.4, //Can change it to 1 or 0.7 since we are only showing chart
                child: Chart(_weeklyTransactions),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7, //Can change it to 1 or 0.7 since we are only showing chart
                      child: Chart(_weeklyTransactions),
                    )
                  : txListWidget,
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
