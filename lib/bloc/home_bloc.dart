import 'package:bloc/bloc.dart';
import 'package:either_equatable_app/bloc/home_event.dart';
import 'package:either_equatable_app/bloc/home_state.dart';

class HomeBloc extends Bloc<ClickEvent, HomeState> {
  HomeBloc() : super(InitHome()) {
    on<ClickEvent>(
      (event, emit) {
        emit(UpdateHome(10));
      },
    );
  }
}
