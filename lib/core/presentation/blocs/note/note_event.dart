import 'package:equatable/equatable.dart';
import 'package:notez_appz/core/domain/entities/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final Note note;

  const AddNote(this.note);

  @override
  List<Object> get props => [note];
}

class UpdateNote extends NoteEvent {
  final Note note;

  const UpdateNote(this.note);

  @override
  List<Object> get props => [note];
}

class DeleteNote extends NoteEvent {
  final String id;

  const DeleteNote(this.id);

  @override
  List<Object> get props => [id];
}
