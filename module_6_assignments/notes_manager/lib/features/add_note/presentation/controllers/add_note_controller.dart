import 'package:flutter/foundation.dart';
import '../../../../core/common/repositories/note_repository.dart';

class AddNoteController extends ChangeNotifier {
  final NoteRepository _repository;

  AddNoteController(this._repository);

  bool _isSaving = false;
  bool get isSaving => _isSaving;

  Future<void> saveNote({
    String? id,
    required String title,
    required String description,
  }) async {
    _isSaving = true;
    notifyListeners();

    try {
      if (id == null) {
        await _repository.addNote(title, description);
      } else {
        await _repository.updateNote(id, title, description);
      }
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  Future<void> deleteNote(String id) async {
    await _repository.deleteNote(id);
  }
}