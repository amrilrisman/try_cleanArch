import 'package:core/domain/entity/todo_entity.dart';
import 'package:equatable/equatable.dart';

class TodoModels extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool active;

  const TodoModels({
    required this.id,
    required this.title,
    required this.description,
    required this.active,
  });

  factory TodoModels.fromJson(Map<dynamic, dynamic> json) => TodoModels(
        id: json["id"],
        title: json["title"],
        description: json["subtitle"],
        active: json["active"] == 0 ? false : true,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": description,
        "active": active == true ? 1 : 0,
      };

  TodoEntity toEntity() {
    return TodoEntity(
      title: title,
      description: description,
      active: active,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        active,
      ];
}
