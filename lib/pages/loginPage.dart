import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/mobileHomePage.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/web/webHomePage.dart';
// import 'package:whatsapp/global.dart' as globals;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserModel? sourceChat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("abisni"),
      ),
      body: ListView.builder(
        itemCount: userModel.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            sourceChat = userModel.removeAt(i);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (builder) {
                return LayoutBuilder(builder: ((context, constraints) {
                  return (constraints.maxWidth > 700)
                      ? WebHomePage(
                          userModel: userModel, sourceChat: sourceChat!)
                      : WhatsAppHome(
                          userModel: userModel, sourceChat: sourceChat!);
                }));
                // ),
              }),
            );
          },
          child:
              // CustomUser(isChatPage: false, userModel: userModel[i], isContactPage: false, isLoginPage: true,),
              Column(
            children: [
              ListTile(
                minVerticalPadding: 4,
                leading: CircularAvatarWidget(
                  userModel: userModel[i],
                  radiusOfAvatar: 25,
                  isChatPage: false,
                  isContactPage: true,
                  isStatusPage: false,
                ),
                title: Text(
                  userModel[i].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
