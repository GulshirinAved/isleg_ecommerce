part of 'banner_bloc.dart';

sealed class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerLoaded extends BannerState {
  final List<dynamic> bannerList;

  const BannerLoaded({required this.bannerList});
}

final class BannerError extends BannerState {
  final String? error;

  const BannerError({required this.error});
}
