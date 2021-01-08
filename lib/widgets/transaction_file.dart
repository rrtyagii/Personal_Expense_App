import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:flutter/foundation.dart';

import '../models/transaction.dart';

/** Instead of using a card with our custom styling and custom setups, 
 * one alternative is a widget built into flutter.
 * 
 * @ListTile Widget, 
 * 
 * You can use in conjunction with lists but you don't have to use it in
 * conjuction
 */
class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  //this hard coded height will pose a problem in our app when we switch to
//landscape mode as the height will less in landscape mode. But when we
//scroll all the we down to the list, we have problem scrolling back up
//because the barchart is not scrollable but the list is. So the screen is
//bounded by the list and limits us to scroll back it up.
//Can fix this with using a dynamically calculated size of the screen

  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrainsts) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Transaction Added yet! ",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //height: 200
                    height: constrainsts.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Dismissible(
                key: Key(widget.transactions[index].getId()),
                onDismissed: (direction) =>
                    widget.deleteTx(widget.transactions[index].getId()),
                background: Container(
                  color: Colors.red,
                ),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${widget.transactions[index].getAmount()}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.transactions[index].getTitle(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd()
                          .format(widget.transactions[index].getDate()),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>
                          widget.deleteTx(widget.transactions[index].getId()),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.transactions.length,
          );
  }
}

// return Card(
//   child: Row(
//     children: <Widget>[
//       Container(
//         margin:
//             EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           border: Border.all(
//             width: 2,
//             color: Colors.blue[600],
//           ),
//         ),
//         child: Text(
//           '\S${transactions[index].getAmount().toStringAsFixed(2)}', // + tx.getAmount().toString(),
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             fontStyle: FontStyle.italic,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             transactions[index].getTitle(),
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           Text(
//             DateFormat("MM-dd-yyyy")
//                 .format(transactions[index].getDate()),
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       )
//     ],
//   ),
// );
