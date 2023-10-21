import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class InitHome extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateHome extends HomeState {
  int x;
  UpdateHome(this.x);

  @override
  // TODO: implement props
  List<Object?> get props => [x];
}
