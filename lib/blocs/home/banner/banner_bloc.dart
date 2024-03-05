import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/data/api_respositories/banner_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    final BannerRepository bannerRepository = BannerRepository();
    on<GetBannerList>((event, emit) async {
      try {
        emit(BannerLoading());
        final List<dynamic> bannerList =
            await bannerRepository.fetchBannerList();
        emit(BannerLoaded(bannerList: bannerList));
      } catch (e) {
        emit(BannerError(error: e.toString()));
      }
    });
  }
}
