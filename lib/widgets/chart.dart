import 'package:budgetApp/widgets/chars_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chars_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].getDate().day == weekDay.day &&
            recentTransactions[i].getDate().month == weekDay.month &&
            recentTransactions[i].getDate().year == weekDay.year) {
          totalSum += recentTransactions[i].getAmount();
        }
      }

//      print(DateFormat.E().format(weekDay));
//      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum
      };
    });
  }

//fold allows us to change a list to another type with a certain logic we define in the function we pass
//to fold. We need a double but groupTransactionValues is List so changing it to double.

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, e) {
      return (sum + e['amount']);
    });
  }

  @override
  Widget build(BuildContext context) {
//    print(groupedTransactionValues);
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupedTransactionValues.map((e) {
          return ChartBar(
            e['day'],
            e['amount'],
            (e['amount'] as double) / maxSpending,
          );
        }).toList(),
      ),
    );
  }
}