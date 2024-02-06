import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';

part 'delivery_selection_event.dart';
part 'delivery_selection_state.dart';

class DeliverySelectionBloc
    extends Bloc<DeliverySelectionEvent, DeliverySelectionState> {
  DeliverySelectionBloc()
      : super(DeliverySelectionInitial(selectedText: deliveryTime[0])) {
    on<DeliverySelectionEvent>((event, emit) {
      emit(DeliverySelectionSuccess(selectedText: event.text));
    });
  }
}
