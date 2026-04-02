import '../../domain/entities/help_item.dart';

class HelpItemModel extends HelpItem {
  HelpItemModel({
    required super.id,
    required super.title,
    required super.content,
    super.icon,
  });

  factory HelpItemModel.fromJson(Map<String, dynamic> json) {
    return HelpItemModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'icon': icon,
    };
  }
}
