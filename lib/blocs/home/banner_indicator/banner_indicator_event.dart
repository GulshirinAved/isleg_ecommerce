part of 'banner_indicator_bloc.dart';

sealed class BannerIndicatorEvent extends Equatable {
  final int eventIndex;
  const BannerIndicatorEvent({required this.eventIndex});

  @override
  List<Object> get props => [eventIndex];
}

final class PressEvent extends BannerIndicatorEvent {
  PressEvent({required super.eventIndex});
}
