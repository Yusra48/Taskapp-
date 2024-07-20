import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String name;
  final String status;
  final String avatarPath;

  Chat(this.name, this.status, this.avatarPath);

  Chat.fromFirestore(DocumentSnapshot doc)
      : name = doc['name'],
        status = doc['status'],
        avatarPath = doc['avatarPath'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'status': status,
      'avatarPath': avatarPath,
    };
  }
}
