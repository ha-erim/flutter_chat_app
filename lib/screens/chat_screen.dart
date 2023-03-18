import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.all(8),
            child: Text('This works!'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('chats')
                  .doc('ylQUyeTNevkd4jprr90t')
                  .collection('messages')
                  .snapshots()
                  .listen((data) {
                print(data.docs[0]['text']);
              });
            }));
  }
}
