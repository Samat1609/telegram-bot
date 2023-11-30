import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damir/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Apis {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  static late ChatUser me;

  static Future<bool> userExists() async {
    return (await firestore
            .collection('users')
            .doc(auth.currentUser!.uid)
            .get())
        .exists;
  }

  static Future<void> getSelfInfo() async {
    await firestore.collection('users').doc(user.uid).get().then((user) async {
      if (user.exists) {
        log('My Data ${user.data()}');
        me = await ChatUser.fromJson(user.data()!);
        log('ChatUser--> ${ChatUser.fromJson(user.data()!)}');
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(
        about: 'I\'m using Damir Chat',
        name: user.displayName.toString(),
        id: user.uid,
        email: user.email.toString(),
        createAt: time,
        image: user.photoURL.toString());

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return firestore
        .collection('users')
        .where('id', isNotEqualTo: user.uid)
        .snapshots();
  }
}
