part of 'payment_selection_bloc.dart';

sealed class PaymentSelectionEvent extends Equatable {
  final String option;
  const PaymentSelectionEvent({required this.option});

  @override
  List<Object> get props => [option];
}

class ChangeOptionEvent extends PaymentSelectionEvent {
  const ChangeOptionEvent({required super.option});
}
