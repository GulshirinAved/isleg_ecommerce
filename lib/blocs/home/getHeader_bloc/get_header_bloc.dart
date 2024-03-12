import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/data/api_respositories/getHeaderData_repository.dart';

part 'get_header_event.dart';
part 'get_header_state.dart';

class GetHeaderBloc extends Bloc<GetHeaderEvent, GetHeaderState> {
  GetHeaderBloc() : super(GetHeaderInitial()) {
    final GetHeaderRepository getHeaderRepository = GetHeaderRepository();
    on<GetHeaderEvent>((event, emit) async {
      try {
        emit(GetHeaderLoading());
        final List<dynamic> getheaderList =
            await getHeaderRepository.fetchGetHeaderList();
        emit(GetHeaderLoaded(getHeaderList: getheaderList));
      } catch (e) {
        emit(GetHeaderError(error: e.toString()));
      }
    });
  }
}
