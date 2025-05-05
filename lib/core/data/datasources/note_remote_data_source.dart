import 'package:notez_appz/core/data/models/note_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NoteRemoteDataSource {
  final _client = Supabase.instance.client;

  Future<List<NoteModel>> getNotes() async {
    final user = _client.auth.currentUser;
    final response = await _client
        .from('notes')
        .select()
        .eq('user_id', user!.id)
        .order('created_at', ascending: false);

    return (response as List)
        .map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> addNote(NoteModel note) async {
    await _client.from('notes').insert(note.toJson());
  }

  Future<void> updateNote(NoteModel note) async {
    await _client.from('notes').update(note.toJson()).eq('id', note.id);
  }

  Future<void> deleteNote(String id) async {
    await _client.from('notes').delete().eq('id', id);
  }
}
