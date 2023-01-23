import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  const TodoEntity({
    required this.title,
    required this.description,
    this.active = false,
  });

  final String title;
  final String description;
  final bool? active;

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": description,
        "active": active == true ? false : 0,
      };

  @override
  List<Object?> get props => [
        title,
        description,
        active,
      ];
}
