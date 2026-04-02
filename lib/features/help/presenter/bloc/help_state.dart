import '../../domain/entities/help_item.dart';

enum HelpStatus { initial, loading, success, failure }

class HelpState {
  final HelpStatus status;
  final List<HelpItem> items;
  final String? errorMessage;

  const HelpState({
    this.status = HelpStatus.initial,
    this.items = const [],
    this.errorMessage,
  });

  HelpState copyWith({
    HelpStatus? status,
    List<HelpItem>? items,
    String? errorMessage,
  }) {
    return HelpState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
