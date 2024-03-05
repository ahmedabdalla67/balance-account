abstract class GetAcountStates {}

class InitialState extends GetAcountStates {}

class LoadingState extends GetAcountStates {}
class GetSuccessState extends GetAcountStates {}

class GetFailureState extends GetAcountStates {
  final String errMessage;

  GetFailureState(this.errMessage);
}
