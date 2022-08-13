import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/home.dart';
import 'package:whatsapp/models/chat_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   late UserModel sourceChat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("abisni"),
      ),
      body: ListView.builder(
        itemCount: userModel.length,
        itemBuilder: (context, i)=> InkWell(
          onTap: (){
            sourceChat = userModel.removeAt(i);
            print("dmof");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> WhatsAppHome(userModel: userModel,)));
          },
          child: CustomUser(isChatPage: false, userModel: userModel[i], isContactPage: false, isLoginPage: true,))

        )
    );
  }
}