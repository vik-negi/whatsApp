import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/models/chat_model.dart';

class Status extends StatefulWidget {
  const Status(
      {Key? key, required this.userModelChat, required this.sourceChat})
      : super(key: key);
  final List<UserModel> userModelChat;
  final UserModel sourceChat;

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(
            leading: CircularAvatarWidget(
              radiusOfAvatar: 25,
              isChatPage: false,
              isContactPage: false,
              userModel: widget.sourceChat,
              isStatusPage: true,
            ),
            title: const Text("My Status"),
            subtitle: const Text("Text to add status update"),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Text(
                "Recent updates",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: statusModel.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor:
                            const Color.fromARGB(255, 218, 218, 218),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(statusModel[i].avatarUrl),
                        ),
                        //     Stack(
                        //       clipBehavior: Clip.hardEdge,
                        //       children: const [
                        //   Icon(
                        //     Icons.person,
                        //     color: Colors.white,
                        //     size: 40,
                        //   ),
                        // ]),
                      ),
                      title: Text(
                        statusModel[i].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        statusModel[i].caption,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
