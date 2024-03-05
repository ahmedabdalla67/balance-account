import 'dart:io';

import 'package:acount_balance/cubit/my_cubit.dart';
import 'package:acount_balance/error.dart';
import 'package:acount_balance/home.dart';
import 'package:acount_balance/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init;
  //HandshakeException
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit()..getRootAccounts(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: RootAccounts(),
      ),
    );
  }
}
