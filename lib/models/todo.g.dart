// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoFromJson(Map<String, dynamic> json) => TodoItem(
      json['title'] as String,
      json['completed'] as bool,
    );

Map<String, dynamic> _$TodoToJson(TodoItem instance) => <String, dynamic>{
      'title': instance.title,
      'completed': instance.isCompleted,
    };
