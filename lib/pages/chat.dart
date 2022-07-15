import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/main.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/contact.dart';


class Chats extends StatefulWidget {
  const Chats({ Key? key }) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
        itemCount: userModel.length,
        itemBuilder: (BuildContext, i)=>Padding(
          padding: EdgeInsets.only(top: 2,bottom: i== userModel.length - 1 ? 65.0 : 2.0),
          child: CustomUser(userModel: userModel[i],isChatPage: true, isContactPage: false,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.message),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> ContactPage()));
        },
      ),
    );
  }
}