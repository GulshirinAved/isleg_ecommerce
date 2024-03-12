import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    final Box langBox = Hive.box('lang');

    on<LanguageEvent>((event, emit) {
      if (event is InitialLanguageEvent) {
        if (langBox.get('lang') != null) {
          if (langBox.get('lang') == 'ru') {
            emit(const ChangeLanguageState(languageCode: 'ru'));
          } else {
            emit(const ChangeLanguageState(languageCode: 'tr'));
          }
        }
      } else if (event is RussianLanguageEvent) {
        langBox.put('lang', 'ru');
        emit(const ChangeLanguageState(languageCode: 'ru'));
      } else if (event is TurkmenLanguageEvent) {
        langBox.put('lang', 'tm');
        emit(const ChangeLanguageState(languageCode: 'tr'));
      }
    });
  }
}
