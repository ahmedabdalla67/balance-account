import 'package:acount_balance/cubit/my_cubit.dart';
import 'package:acount_balance/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootAccounts extends StatelessWidget {
  const RootAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Root Accounts'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Data>>(
          future: BlocProvider.of<MyCubit>(context).getRootAccounts(),
          builder: (context, snapshot) {
            var accounts = BlocProvider.of<MyCubit>(context).listOfAccount;
            if (snapshot.hasData) {
              accounts = snapshot.data!;
              return Column(children: [
                // Table(
                //   border: TableBorder.all(),
                //   children: [
                //     headersRow(['Top Level Account', 'Total Balance']),
                //   ],

                // ),

                DataTable(
                    columns: const [
                      DataColumn(label: Text('Top Level Account')),
                      DataColumn(label: Text('Total Balance')),
                    ],
                    rows: List<DataRow>.generate(
                        3,
                        (index) => DataRow(
                              cells: [
                                DataCell(onTap: () {
                                  dialog(context, 'acount', 'balalnce');
                                }, Text(accounts[index].topLevelAccount)),
                                DataCell(onTap: () {
                                  dialog(context, 'acount', 'balalnce');
                                },
                                    Text(accounts[index]
                                        .totalBalance
                                        .toString())),
                              ],
                            )))

                // Expanded(
                //   child: Table(
                //     border: TableBorder.all(),
                //     children: [
                //       tableCells(context, '01', '200'),
                //       tableCells(context, '05', '230'),
                //       tableCells(context, '10', '200'),
                //     ],
                //   ),
                // ),
                // DataTable(columns: [
                //   DataColumn(label: ,)
                // ], rows: [DataRow(cells: cells)])
              ]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
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
  // TableRow tableCells(context, rootAccount, balance) {
  //   return TableRow(children: [
  //     Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: InkWell(
  //           onTap: () {
  //             dialog(context, rootAccount, balance);
  //           },
  //           child: Text(rootAccount)),
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: InkWell(
  //           onTap: () {
  //             dialog(context, rootAccount, balance);
  //           },
  //           child: Text(balance)),
  //     ),
  //   ]);
  // }

  Future dialog(context, acount, balalnce) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Details'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Account $acount + $acount + $acount = 100'),
              Text('Account $acount + $acount = 100'),
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
