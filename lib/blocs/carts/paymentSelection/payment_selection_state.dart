part of 'payment_selection_bloc.dart';

sealed class PaymentSelectionState extends Equatable {
  final String selectedText;

  const PaymentSelectionState({required this.selectedText});

  @override
  List<Object> get props => [selectedText];
}

final class PaymentSelectionInitial extends PaymentSelectionState {
  const PaymentSelectionInitial({required super.selectedText});
}

final class PaymentSelectionSucess extends PaymentSelectionState {
  const PaymentSelectionSucess({required super.selectedText});
}
