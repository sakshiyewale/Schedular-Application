import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>
{
    LoginBloc(): super(InitialState())
    {
        on<LoginSuccesfulEvent>((event,emit) => emit(LoginSuccesfullState()));
        on<LoginUnSuccesfulEvent>((event, emit) => emit(LoginUnsuccesfullState()));

        on<LoginValidationEvent>((event, emit) {
           if(event.username =="")
               {
                   emit(LoginNotValidState("Please Enter the Username"));
               }
           else if(event.password=="")
               {
                   emit(LoginNotValidState("Please Enter the Password"));
               }
           else
               {
                   emit(LoginValidateState("Succesfully Login"));
               }
        });

    }
}