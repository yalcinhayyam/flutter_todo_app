import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class TodoItem {
  final String title;
  final bool isCompleted;

  TodoItem(this.title, this.isCompleted);

  factory TodoItem.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
