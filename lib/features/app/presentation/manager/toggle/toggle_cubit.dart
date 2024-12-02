import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<int> {
  ToggleCubit() : super(0);
  void toggle({required int value}) {
    emit(value);
  }
}
