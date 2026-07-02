import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

class NoteRepository {
  final CollectionReference _notesRef =
      FirebaseFirestore.instance.collection('notes');

  Stream<List<NoteModel>> getNotes() {
    return _notesRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => NoteModel.fromFirestore(doc)).toList());
  }

  Future<void> addNote(String title, String description) {
    return _notesRef.add({
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateNote(String id, String title, String description) {
    return _notesRef.doc(id).update({
      'title': title,
      
      'description': description,
    });
  }

  Future<void> deleteNote(String id) {
    return _notesRef.doc(id).delete();
  }
}