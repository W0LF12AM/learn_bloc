import 'package:notez_appz/core/data/datasources/note_remote_data_source.dart';
import 'package:notez_appz/core/data/models/note_model.dart';
import 'package:notez_appz/core/domain/entities/note.dart';
import 'package:notez_appz/core/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDataSource remoteDataSource;

  NoteRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Note>> getNotes() async {
    return remoteDataSource.getNotes();
  }

  @override
  Future<void> addNote(Note note) async {
    return remoteDataSource.addNote(NoteModel(
        id: note.id,
        userId: note.userId,
        title: note.title,
        content: note.content,
        createdAt: note.createdAt));
  }

  @override
  Future<void> updateNote(Note note) async {
    return remoteDataSource.updateNote(NoteModel(
        id: note.id,
        userId: note.userId,
        title: note.title,
        content: note.content,
        createdAt: note.createdAt));
  }

  @override
  Future<void> deleteNote(String id) async {
    return remoteDataSource.deleteNote(id);
  }
}
