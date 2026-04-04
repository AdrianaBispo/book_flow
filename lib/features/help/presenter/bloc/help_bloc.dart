import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/app/app.dart';
import '../presenter.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  final Usecase getHelpItems;

  HelpBloc({required this.getHelpItems}) : super(const HelpState()) {
    on<HelpGetItemsStarted>(_onGetItemsStarted);
  }

  Future<void> _onGetItemsStarted(
    HelpGetItemsStarted event,
    Emitter<HelpState> emit,
  ) async {
    emit(state.copyWith(status: HelpStatus.loading));

    final result = await getHelpItems();

    result.fold(
      (error) => emit(state.copyWith(
        status: HelpStatus.failure,
        errorMessage: error.toString(),
      )),
      (items) => emit(state.copyWith(
        status: HelpStatus.success,
        items: items,
      )),
    );
  }
}
