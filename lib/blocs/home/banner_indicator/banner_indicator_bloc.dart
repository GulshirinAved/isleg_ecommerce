import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'banner_indicator_event.dart';
part 'banner_indicator_state.dart';

class BannerIndicatorBloc extends Bloc<BannerIndicatorEvent, BannerIndicatorState> {
  BannerIndicatorBloc() : super(BannerIndicatorInitial()) {
    on<BannerIndicatorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
