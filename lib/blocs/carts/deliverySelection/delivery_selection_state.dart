part of 'delivery_selection_bloc.dart';

sealed class DeliverySelectionState extends Equatable {
  final String selectedText;
  const DeliverySelectionState({required this.selectedText});

  @override
  List<Object> get props => [selectedText];
}

final class DeliverySelectionInitial extends DeliverySelectionState {
  const DeliverySelectionInitial({required super.selectedText});
}

final class DeliverySelectionSuccess extends DeliverySelectionState {
  const DeliverySelectionSuccess({required super.selectedText});
}
