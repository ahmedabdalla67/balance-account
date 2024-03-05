import 'package:flutter/material.dart';

class TableByRows extends StatelessWidget {
  const TableByRows({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(children: [
        Text('Root Acounts'),
        Divider(
          height: 16,
        ),
        Text('Total Balance')
      ]),
    );
  }
}
