import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTransaction extends StatefulWidget {
  final Function addfun;

  InputTransaction(this.addfun);

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  DateTime datenew;

  void submitData() {
    final titletext = titleController.text;
    final price = double.parse(priceController.text);
    if (titletext.isEmpty || price <= 0 || datenew == null) {
      return;
    }
    widget.addfun(titletext, price, datenew);
    Navigator.of(context).pop();
  }

  void selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        datenew = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: priceController,
              onSubmitted: (_) => submitData(),
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(datenew == null
                      ? 'select date'
                      : DateFormat('dd-MM-yyyy').format(datenew)),
                ),
                RaisedButton(
                  onPressed: selectDate,
                  child: Text('Select Date'),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add transaction'),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
