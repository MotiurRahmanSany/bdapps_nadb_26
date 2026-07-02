import 'package:flutter/foundation.dart';
import '../../../../core/common/models/note_model.dart';
import '../../../../core/common/repositories/note_repository.dart';

class HomeController extends ChangeNotifier {
  final NoteRepository _repository;

  HomeController(this._repository);

  Stream<List<NoteModel>> get notesStream => _repository.getNotes();

  Future<void> deleteNote(String id) async {
    await _repository.deleteNote(id);
  }
}
