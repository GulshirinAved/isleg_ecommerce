import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';

part 'payment_selection_event.dart';
part 'payment_selection_state.dart';

class PaymentSelectionBloc
    extends Bloc<PaymentSelectionEvent, PaymentSelectionState> {
  PaymentSelectionBloc()
      : super(PaymentSelectionInitial(selectedText: payment[0])) {
    on<ChangeOptionEvent>((event, emit) {
      emit(PaymentSelectionSucess(selectedText: event.option));
    });
  }
}
