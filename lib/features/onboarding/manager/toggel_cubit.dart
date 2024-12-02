import 'package:flutter_bloc/flutter_bloc.dart';

class ToggelCubit extends Cubit<int> {
  ToggelCubit() : super(0);
  void chagenIndex(int index) => emit(index);
}
