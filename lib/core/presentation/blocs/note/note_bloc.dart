import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez_appz/core/domain/repositories/note_repository.dart';
import 'package:notez_appz/core/presentation/blocs/note/note_event.dart';
import 'package:notez_appz/core/presentation/blocs/note/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository repository;

  NoteBloc(this.repository) : super(NoteInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final notes = await repository.getNotes();
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteError('Failed to load notes: $e'));
    }
  }

  Future<void> _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    try {
      await repository.addNote(event.note);
      add(LoadNotes());
    } catch (e) {
      emit(NoteError('Failed to add note: $e'));
    }
  }

  Future<void> _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) async {
    try {
      await repository.updateNote(event.note);
      add(LoadNotes());
    } catch (e) {
      emit(NoteError('Failed to update note: $e'));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    try {
      await repository.deleteNote(event.id);
      add(LoadNotes());
    } catch (e) {
      emit(NoteError('Failed to delete note: $e'));
    }
  }
}
