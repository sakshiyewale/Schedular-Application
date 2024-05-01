
import '../../Model/Model1.dart';


abstract class HomeState {}

class HomeDataInitialState extends HomeState {}

class HomeDataLoadingState extends HomeState {}

class HomeDataSuccessfulFetchState extends HomeState {
  final List<Model1> student;

  HomeDataSuccessfulFetchState({required this.student});
}

class HomedataFailedFetchState extends HomeState {
  final String fetcherror;

  HomedataFailedFetchState({required this.fetcherror});
}
