
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/Model1.dart';
import '../../repository/home_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeDataBloc extends Bloc<HomeEvent, HomeState> {
  HomeDataBloc() : super(HomeDataInitialState()) {
    on<HomeDataFetchEvent>(homeDataFetchEvent);
  }

  Future<void> homeDataFetchEvent(
      HomeDataFetchEvent event, Emitter<HomeState> emit) async {
    try {
      print(2);
      List<Model1> student =
      await HomeRepo.HomeRepoFetchEvent();
      print(student);
    if(student.isNotEmpty) {
      emit(HomeDataSuccessfulFetchState(student: student));
    }else{
      emit(HomedataFailedFetchState(fetcherror: 'Unable to Fetch'));
    }
    } catch (e) {
      emit(HomedataFailedFetchState(fetcherror: 'Unable to Fetch'));
    }
  }

//return examinars;
}
