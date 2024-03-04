import 'package:dio/dio.dart';

class GetAllAccounts {
  final dio = Dio();

  void getAccounts() async {
    final response = await dio.get('https://localhost:808/getaccounts');
    print(response.data.toString());
  }
}
