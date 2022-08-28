import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/contact.dart';

class Chats extends StatefulWidget {
  const Chats({
    Key? key,
    required this.userModelChat,
    required this.sourceChat,
    required this.isWeb,
    required this.controller,
  }) : super(key: key);
  final List<UserModel> userModelChat;
  final UserModel sourceChat;
  final bool isWeb;
  final ScrollController controller;

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          // controller: widget.controller,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.userModelChat.length,
          itemBuilder: (context, i) => Padding(
            padding: EdgeInsets.only(
                top: 2,
                bottom: i == widget.userModelChat.length - 1 ? 65.0 : 2.0),
            child: CustomUser(
              userModel: widget.userModelChat[i],
              isChatPage: true,
              isContactPage: false,
              isLoginPage: false,
              sourceChat: widget.sourceChat,
            ),
          ),
        ),
      ),
      floatingActionButton: !widget.isWeb
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => ContactPage(
                      sourceChat: widget.sourceChat,
                    ),
                  ),
                );
              },
            )
          : null,
    );
  }
}
