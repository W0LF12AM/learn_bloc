import 'package:notez_appz/core/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.content,
    required super.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        content: json['content'],
        createdAt: DateTime.parse(json['created_at']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
