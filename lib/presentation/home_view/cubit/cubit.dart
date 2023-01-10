import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task9_1/domain/models/expert_model/expert_model.dart';
import 'package:task9_1/presentation/home_view/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<ExpertModel> experts = dummyExperts.experts;

  toggleFavoriteByItsName({required String title}) {
    for (int i = 0; i < experts.length; i++) {
      if (experts[i].name == title) {
        experts[i].isFavorite = !experts[i].isFavorite;
      }
    }
    emit(HomeChangeState());
  }
}
