part of 'delivery_selection_bloc.dart';

sealed class DeliverySelectionEvent extends Equatable {
  final String text;
  const DeliverySelectionEvent({required this.text});

  @override
  List<Object> get props => [text];
}

class ChangeOptionDeliveryEvent extends DeliverySelectionEvent {
  const ChangeOptionDeliveryEvent({required super.text});
}
