import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlutterChat'), actions: [
        DropdownButton(
          icon: Icon(
            Icons.more_vert,
            color: Theme.of(context).primaryIconTheme.color,
          ),
          items: [
            DropdownMenuItem(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
              value: 'logout',
            )
          ],
          onChanged: (itemIdentifier) {
            if (itemIdentifier == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          },
        )
      ]),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc('ylQUyeTNevkd4jprr90t')
            .collection('messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data?.docs;
          return ListView.builder(
            itemCount: documents!.length, //add !
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats')
              .doc('ylQUyeTNevkd4jprr90t')
              .collection('messages')
              .add({'text': 'This was added by clicking the button!'});
        },
      ),
    );
  }
}
