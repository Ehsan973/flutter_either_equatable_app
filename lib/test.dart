import 'package:dartz/dartz.dart';

Either<String, List<String>> sendDataRequest(int x) {
  if (x == 1) {
    return Right(['Amirahmad', 'Reza', 'Ali']);
  } else {
    return Left('There is an error!');
  }
}
