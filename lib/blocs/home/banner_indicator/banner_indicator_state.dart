part of 'banner_indicator_bloc.dart';

sealed class BannerIndicatorState extends Equatable {
  const BannerIndicatorState();
  
  @override
  List<Object> get props => [];
}

final class BannerIndicatorInitial extends BannerIndicatorState {}
