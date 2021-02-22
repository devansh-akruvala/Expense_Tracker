import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/bar_chart.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupRecentTransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double amount = 0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          amount += recentTransaction[i].price;
        }
      }
      return {'day': DateFormat.E().format(weekday), 'amount': amount};
    });
  }

  double get totalSum {
    return groupRecentTransaction.fold(0.0, (sum, element) {
      return sum += element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupRecentTransaction);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupRecentTransaction.map((e) {
          return Flexible(
            fit: FlexFit.tight,
            child: BarChart(e['day'], e['amount'],
                totalSum == 0.0 ? 0.0 : (e['amount'] as double) / totalSum),
          );
        }).toList(),
      ),
    );
  }
}
