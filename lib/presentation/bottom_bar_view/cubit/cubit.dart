import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task9_1/presentation/bottom_bar_view/cubit/states.dart';

class IndexCubit extends Cubit<IndexStates> {
  IndexCubit() : super(IndexInitialState());

  static IndexCubit get(context) => BlocProvider.of(context);
  int index = 0;
  void setIndex(int index){
    this.index = index;
    emit(IndexChangeState());
  }
}
