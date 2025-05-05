class Note {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
  });
}
