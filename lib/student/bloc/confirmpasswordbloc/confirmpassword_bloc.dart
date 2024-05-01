import 'package:flutter_bloc/flutter_bloc.dart';
import 'confirmpassword_event.dart';
import 'confirmpassword_state.dart';

class ConfirmPasswordBloc extends Bloc<ConfirmPasswordEvent,ConfirmPasswordState>
{
  ConfirmPasswordBloc():super(InitialState())
  {
  on<ConfirmPasswordEventSuccess>((event,emit) => emit(ConfirmPasswordStateSuccess()));
  on<ConfirmPasswordEventUnsuccess>((event,emit) => emit(ConfirmPasswordStateUnsuccess()));

  }
}