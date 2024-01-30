import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banner_indicator_event.dart';
part 'banner_indicator_state.dart';

class BannerIndicatorBloc
    extends Bloc<BannerIndicatorEvent, BannerIndicatorState> {
  BannerIndicatorBloc() : super(BannerIndicatorInitial(stateIndex: 0)) {
    on<PressEvent>((event, emit) {
      emit(state.copyWith(stateIndex: event.eventIndex));
    });
  }
}
