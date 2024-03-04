import 'package:flutter/material.dart';

class RootAccounts extends StatelessWidget {
  const RootAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Root Accounts'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Table(
            border: TableBorder.all(),
            children: [
              headersRow(['Top Level Account', 'Total Balance']),
            ],
          ),
          Expanded(
            child: Table(
              border: TableBorder.all(),
              children: [
                tableCells(context, '01', '200'),
                tableCells(context, '05', '230'),
                tableCells(context, '10', '200')
              ],
            ),
          ),
        ]),
      ),
    );
  }

  TableRow headersRow(List<String> cells) => TableRow(
      children: cells
          .map((cell) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    cell,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ))
          .toList());
  // TableRow cellRow(context, List<String> cells) => TableRow(
  //     children: cells
  //         .map(
  //           (cell) => InkWell(
  //             onDoubleTap: () {
  //               dialog(context, cell, cells[1]);
  //             },
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(
  //                 cell,
  //               ),
  //             ),
  //           ),
  //         )
  //         .toList());

  TableRow tableCells(context, rootAccount, balance) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              dialog(context, rootAccount, balance);
            },
            child: Text(rootAccount)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              dialog(context, rootAccount, balance);
            },
            child: Text(balance)),
      ),
    ]);
  }

  Future dialog(context, acount, balalnce) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Details'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Account $acount + $acount + $acount = $balalnce'),
              Text('Account $acount + $acount = $balalnce'),
            ]),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
