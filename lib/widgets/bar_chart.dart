import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String label;
  final double total;
  final double percentageoftotal;

  BarChart(this.label, this.total, this.percentageoftotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('${total.toStringAsFixed(2)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          /////showing bar
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(2))),
              FractionallySizedBox(
                heightFactor: percentageoftotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(2)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
