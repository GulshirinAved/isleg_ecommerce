// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'banner_indicator_bloc.dart';

class BannerIndicatorState extends Equatable {
  final int stateIndex;

  const BannerIndicatorState({required this.stateIndex});

  @override
  List<Object> get props => [stateIndex];

  BannerIndicatorState copyWith({
    int? stateIndex,
  }) {
    return BannerIndicatorState(
      stateIndex: stateIndex ?? this.stateIndex,
    );
  }
}

final class BannerIndicatorInitial extends BannerIndicatorState {
  BannerIndicatorInitial({required super.stateIndex});
}

final class SuccessState extends BannerIndicatorState {
  SuccessState({required super.stateIndex});
}
