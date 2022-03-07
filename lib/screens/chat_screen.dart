// ignore_for_file: avoid_print

// import 'package:chat_application/screens/push_notifications_screen.dart';
import 'package:chat_application/widgets/chat/messages.dart';
import 'package:chat_application/widgets/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color),
            items: [
              DropdownMenuItem<dynamic>(
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text('Log Out'),
                  ],
                ),
                value: 'Log Out',
              ),
            ],
            onChanged: (dynamic itemIdentifier) {
              if (itemIdentifier == 'Log Out') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      ),

      //  Column(
      //   children: [
      //     Expanded(
      //       child:
      //           // Using FutureBuilder to retrieve data
      //           //         FutureBuilder<QuerySnapshot>(
      //           //   // Passing `Future<QuerySnapshot>` to future
      //           //   future: FirebaseFirestore.instance.collection('chats').get(),
      //           //   builder: (context, snapshot) {
      //           //     if (snapshot.hasData) {
      //           //       // Retrieving `List<DocumentSnapshot>` from snapshot
      //           //       final List<DocumentSnapshot> documents = snapshot.data!.docs;
      //           //       return ListView(
      //           //           children: documents
      //           //               .map(
      //           //                 (doc) => Card(
      //           //                   child: ListTile(
      //           //                     title: Text(doc['text']),
      //           //                   ),
      //           //                 ),
      //           //               )
      //           //               .toList());
      //           //     } else if (snapshot.connectionState == ConnectionState.waiting) {
      //           //       return const Center(
      //           //         child: CircularProgressIndicator(),
      //           //       );
      //           //     } else {
      //           //       return const Text('Error has occurred!');
      //           //     }
      //           //   },
      //           // )

      //           // Using StreamBuilder to retrieve data
      //           StreamBuilder<QuerySnapshot>(
      //         stream:
      //             FirebaseFirestore.instance.collection('chats').snapshots(),
      //         builder: (context, snapshot) {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return const Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           } else if (snapshot.hasData) {
      //             final documents = snapshot.data!.docs;
      //             return ListView.builder(
      //               itemCount: documents.length,
      //               itemBuilder: (context, index) {
      //                 DocumentSnapshot doc = documents[index];
      //                 return Card(
      //                   child: Text(doc['text']),
      //                 );
      //               },
      //             );
      //           } else {
      //             return const Text('Error has occurred!');
      //           }
      //         },
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const PushNotificationsScreen()),
      //         );
      //       },
      //       child: const Text('Go to Push Notifications Screen'),
      //     )
      //   ],
      // ),
    );
  }
}
