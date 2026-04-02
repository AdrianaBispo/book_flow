import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_help_items.dart';
import 'help_event.dart';
import 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  final GetHelpItems getHelpItems;

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
