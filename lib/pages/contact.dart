import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/components/PopUpMenuBtn.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/global.dart' as globals;
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/createGroup.dart';

class ContactPage extends StatelessWidget {
  ContactPage({
    Key? key,
    required this.sourceChat,
  }) : super(key: key);
  final UserModel sourceChat;
  final List<String> contactPopUp = [
    "Invite a friend",
    "Contacts",
    "Refrest",
    "Help"
  ];
  // List<ChatModel> userContact = chatModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Contact"), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        PopupMenuBtn(items: contactPopUp),
      ]),
      body: ListView.builder(
        itemCount: userModel.length + 2,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const CreateGroupPage())),
                    child: userContactOption(Icons.group, "New group")));
          } else if (i == 1) {
            return userContactOption(Icons.person_add, "New Contact");
          }
          // return userContact(userModel[i-2]);
          else if (userModel[i - 2].isgroup == true) {
            return Container();
          }
          return CustomUser(
              userModel: userModel[i - 2],
              isChatPage: false,
              isContactPage: true,
              iconSize: 22,
              fontSiz: 17,
              fontW: FontWeight.w500,
              isLoginPage: false,
              sourceChat: sourceChat);
        },
      ),
    );
  }

  userContact(UserModel userModel) {
    return ListTile(
      minVerticalPadding: 15,
      leading: const CircleAvatar(
        backgroundColor: Color.fromARGB(205, 9, 125, 101),
        child: Icon(Icons.person),
      ),
      title: Text(
        userModel.name,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      subtitle:
          userModel.status != null ? Text(userModel.status!) : Container(),
    );
  }

  userContactOption(IconData img, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(205, 9, 125, 101),
              child: Icon(
                img,
                color: Colors.white,
              ),
            ),
            title: Text(
              name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          if (name == "New Contact")
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 8.0, left: 16),
              child: Text("Contacts on WhatsApp",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
            ),
        ],
      ),
    );
  }
}
