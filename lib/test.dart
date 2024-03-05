import 'package:acount_balance/cubit/my_cubit.dart';
import 'package:acount_balance/cubit/my_states.dart';
import 'package:acount_balance/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestTable extends StatelessWidget {
  const TestTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Root Accounts'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MyCubit, GetAcountStates>(
          builder: (context, state) {
            // print('data ${MyCubit.get(context).listOfAccount.length}');
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Top Level Account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 1,
                          height: 23,
                          color: Colors.grey,
                        ),
                        const Text(
                          'Total Balance',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                buildRowsTable(context, MyCubit.get(context).listOfAccount),
                const Spacer(
                  flex: 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildRowsTable(context, List<Data> accounts) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    accounts[index].topLevelAccount.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    accounts[index].totalBalance.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          itemCount: accounts.length,
        ),
      ),
    );
  }
}
