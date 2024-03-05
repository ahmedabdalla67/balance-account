import 'package:acount_balance/cubit/my_states.dart';
import 'package:acount_balance/data.dart';
import 'package:acount_balance/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<GetAcountStates> {
  MyCubit() : super(InitialState());
  static MyCubit get(context) => BlocProvider.of(context);

  List<Data> listOfAccount = [];
  Future<List<Data>> getRootAccounts() async {
    try {
      List<dynamic> data = await DioHelper().getData();
      print('data: $data.length');
      for (int i = 0; i < data.length; i++) {
        listOfAccount.add(Data.fromJson(data[i]));
      }
      print(listOfAccount.length);
      emit(GetSuccessState());
    } catch (e) {
      emit(GetFailureState(e.toString()));
    }

    return listOfAccount;
  }

  // List<Data> listOfAccount = [];
  // Future<List<Data>> getRootAccounts() async {
  //   emit(LoadingState());
  //   try {
  //     List<dynamic> data =
  //         await Api().get(url: 'https://91.229.118.182:5000/api/accounts');
  //     // print('data: ${data.length}');

  //     for (int i = 0; i < data.length; i++) {
  //       listOfAccount.add(Data.fromJson(data[i]));
  //     }
  //     print(listOfAccount.length);
  //     emit(GetSuccessState());
  //   } catch (e) {
  //     emit(GetFailureState(e.toString()));
  //   }
  //   return listOfAccount;
  // }
}
