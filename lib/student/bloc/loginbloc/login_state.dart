abstract class LoginState {}

class InitialState extends LoginState{}

class LoginSuccesfullState extends LoginState{}

class LoginUnsuccesfullState extends LoginState{}

class LoginValidateState extends LoginState
{
  String success;
  LoginValidateState(this.success);
}

class LoginNotValidState extends LoginState
{
  String error;
  LoginNotValidState(this.error);
}

class LoginLoadingState extends LoginState
{
  String errorMessage;
  LoginLoadingState(this.errorMessage);
}