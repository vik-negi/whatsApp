import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/userChatPage.dart';


class CustomUser extends StatelessWidget {

  CustomUser( {
    required this.userModel,
    required this.isChatPage,
    required this.isContactPage,
    this.iconSize,
    this.fontSiz,
    this.fontW,
   Key? key}) : super(key: key);
  final UserModel userModel;
  bool isChatPage;
  bool isContactPage;
  double? iconSize;
  double? fontSiz;
  FontWeight? fontW;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap : (){
        if(isChatPage || isContactPage){
          Navigator.push(context, 
          MaterialPageRoute(builder:(context)=> UserChatPage(userModel))
          );
        }
      },
      child: Column(
          children: [
            ListTile(
              minVerticalPadding : isContactPage? 15:4,
              leading: CircularAvatarWidget(
                userModel: userModel, radiusOfAvatar : iconSize??25, isChatPage: isChatPage,isContactPage: isContactPage),
              title: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children : [
                  Text(userModel.name,
                  style :  TextStyle(
                    fontWeight : isContactPage?fontW:FontWeight.w600,
                    fontSize: 17,
                  ),
                  ),
                  isChatPage?Text(
                    userModel.time,
                  style : const TextStyle(
                    color : Colors.grey,
                    fontSize: 14.0,
                  ),
                  ):Container(),
                ],
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5),
                child : Row(
                  children: [
                    userModel.isgroup?Text("${userModel.name}: ",
                      style : const TextStyle(
                      fontSize: 16.0,
                    ),
                    ):isChatPage?const Icon(Icons.done_all_rounded, size: 17,):Container(),
                    isChatPage?Text(userModel.message!,
                    style : const TextStyle(
                      color : Colors.grey,
                      fontSize: 14.0,
                    ),
                    ):Container(),
                    isContactPage?
                    userModel.status != null?
                    Container(
                      width: MediaQuery.of(context).size.width*0.70,
                      child: Text(
                        userModel.status!,maxLines: 1,))
                        :Container()
                    :Container(),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}

class CircularAvatarWidget extends StatelessWidget {

  CircularAvatarWidget({
    Key? key,
    required this.userModel,
    required this.radiusOfAvatar,
    required this.isChatPage,
    required this.isContactPage
  }) : super(key: key);
  final double radiusOfAvatar;
  bool isChatPage;
  bool isContactPage;

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusOfAvatar,

      foregroundColor: Theme.of(context).primaryColor,
      backgroundColor: isContactPage? Color.fromARGB(205, 9, 125, 101):Colors.blueGrey,
      // backgroundImage: NetworkImage(userModel[i].avatarUrl),
      child:  SvgPicture.asset(userModel.isgroup?"assets/svgs/group.svg":"assets/svgs/person.svg", color: const Color.fromARGB(255, 207, 207, 207), width: 32,height: 32,),
      // :SvgPicture.asset("assets/svgs/person.svg", color: const Color.fromARGB(255, 207, 207, 207), width: 32,height: 32,),
    );
  }
}
