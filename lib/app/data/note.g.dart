// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      content: json['content'] as String,
      dateWritten: DateTime.parse(json['dateWritten'] as String),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'content': instance.content,
      'dateWritten': instance.dateWritten.toIso8601String(),
    };
