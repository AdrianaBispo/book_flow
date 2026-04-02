import 'package:myapp/core/core.dart';

class HelpItem {
  final int id;
  final String title;
  final String content;
  final String? icon;

  HelpItem({
    required this.id,
    required this.title,
    required this.content,
    this.icon,
  });
}
