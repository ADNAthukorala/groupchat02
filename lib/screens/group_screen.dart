import 'package:flutter/material.dart';
import 'package:groupchat02/components/message_stream.dart';
import 'package:groupchat02/constants.dart';
import 'package:groupchat02/components/send_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupchat02/components/alert_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  static const String id = 'group_screen';

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String? messageText;
  var messageTextController = TextEditingController();
  bool isButtonDisabled = true;
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('time')
      .snapshots();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertMessage(
          title: 'Error',
          content: e.toString(),
          actionButtonTitle: 'Ok',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kThemeColor01,
          title: const Text('GroupChat'),
          actions: [
            IconButton(
              onPressed: () async {
                await _auth.signOut();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MessageStream(messageStream: _messageStream, loggedInUser: loggedInUser.email!,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        decoration: kMessageTextFieldDecoration,
                        onChanged: (value) {
                          messageText = value;
                          setState(() {
                            messageTextController.text.isEmpty
                                ? isButtonDisabled = true
                                : isButtonDisabled = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    SendButton(
                      onPressed: isButtonDisabled
                          ? null
                          : () {
                              final messagesRef =
                                  _firestore.collection('messages');
                              messagesRef.add({
                                'sender': loggedInUser.email,
                                'message': messageText,
                                'time': FieldValue.serverTimestamp(),
                              });
                              messageTextController.clear();
                              setState(() {
                                isButtonDisabled = true;
                              });
                            },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

