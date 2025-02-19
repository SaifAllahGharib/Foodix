import 'package:firebase_database/firebase_database.dart';

abstract class MainBuyerState {}

class MainBuyerInitState extends MainBuyerState {}

class MainBuyerLoadingState extends MainBuyerState {}

class MainBuyerSuccessState extends MainBuyerState {
  final DataSnapshot snapshot;

  MainBuyerSuccessState(this.snapshot);
}

class MainBuyerFailureState extends MainBuyerState {
  final String errorMsg;

  MainBuyerFailureState(this.errorMsg);
}
