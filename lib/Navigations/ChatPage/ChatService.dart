import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Models/ChatModel.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Chat>> loadChats() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('Chats').get();

      return snapshot.docs.map((doc) => Chat.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching chats: $e');
      return [];
    }
  }
  Stream<List<Chat>> getChats({String query = ''}) {
    return _firestore
        .collection('Chats')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Chat.fromFirestore(doc))
            .toList());
  }
}
