import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delfun;
  TransactionList(this.transactions, this.delfun);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Container(
              child: Column(
                children: [
                  Text("No Transaction"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 300,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 7,
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                              child: Text('Rs.${transactions[index].price}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(DateFormat('dd-MM-yyyy')
                          .format(transactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => delfun(transactions[index].id),
                      )),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
