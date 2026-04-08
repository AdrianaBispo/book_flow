import '../../domain/entities/help_item_entity.dart';

class HelpItemDto extends HelpItemEntity {
  HelpItemDto({
    required super.id,
    required super.title,
    required super.content,
    super.icon,
  });

  HelpItemDto.fromJson(Map<String, dynamic> map)
      : super(
          id: map['id'],
          title: map['title'],
          content: map['content'],
          icon: map['icon'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'icon': icon,
    };
  }
}
