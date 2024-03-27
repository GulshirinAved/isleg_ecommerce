import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  StreamSubscription? subscription;

  InternetConnectionBloc()
      : super(
          InternetConnectionInitial(),
        ) {
    on<InternetConnectedEvent>((event, emit) {
      emit(const InternetConnectedState(internetState: 'Connected....'));
    });
    on<InternetNotConnectedEvent>((event, emit) {
      emit(const InternetNotConnectedState(internetState: 'not Connected....'));
    });
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(const InternetConnectedEvent());
      } else {
        print("it is not connected");
        add(const InternetNotConnectedEvent());
      }
    });
  }
  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
