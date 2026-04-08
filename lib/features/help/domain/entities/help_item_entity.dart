abstract class HelpItemEntity {
  int? id;
  String? title;
  String? content;
  String? icon;

  HelpItemEntity({
    required this.id,
    required this.title,
    required this.content,
    this.icon,
  });
}
