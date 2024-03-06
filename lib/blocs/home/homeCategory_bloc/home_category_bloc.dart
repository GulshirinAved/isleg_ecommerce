import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/data/api_respositories/homeCategory_repository.dart';

part 'home_category_event.dart';
part 'home_category_state.dart';

class HomeCategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  HomeCategoryBloc() : super(HomeCategoryInitial()) {
    final HomeCategoryRepository homeCategoryRepository =
        HomeCategoryRepository();
    on<GetHomeCategoryList>((event, emit) async {
      try {
        emit(HomeCategoryLoading());
        final List<dynamic> homeCategoryList =
            await homeCategoryRepository.fetchHomeCategoryList();
        emit(HomeCategoryLoaded(homeCategoryList: homeCategoryList));
      } catch (e) {
        emit(HomeCategoryError(error: e.toString()));
      }
    });
  }
}
