import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_event.dart';
import 'forget_state.dart';

class ForgetBloc extends Bloc<ForgetEvent,ForgetState>
{
  ForgetBloc():super(InitialState())
  {

  on<ForgetEventSuccess>((event,emit) => emit(ForgetStateSuccess()));
  on<ForgetEventUnsuccess>((event,emit) => emit(ForgetStateUnsuccess()));

  }
}