import "package:flutter/material.dart";
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/userChatPage.dart';

class CustomUser extends StatelessWidget {
  const CustomUser(
      {required this.userModel,
      required this.isChatPage,
      required this.isContactPage,
      required this.isLoginPage,
      required this.sourceChat,
      this.iconSize,
      this.fontSiz,
      this.fontW,
      Key? key})
      : super(key: key);
  final UserModel userModel;
  final UserModel sourceChat;
  final bool isLoginPage;
  final bool isChatPage;
  final bool isContactPage;
  final double? iconSize;
  final double? fontSiz;
  final FontWeight? fontW;

  // late  UserModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return isLoginPage
        ? CustomUserCard(
            isContactPage: isContactPage,
            userModel: userModel,
            iconSize: iconSize,
            isChatPage: isChatPage,
            fontW: fontW,
            isStatusPage: false,
          )
        : InkWell(
            onTap: () {
              if (isChatPage || isContactPage) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserChatPage(userModel, sourceChat)));
              }
            },
            child: CustomUserCard(
              isContactPage: isContactPage,
              userModel: userModel,
              iconSize: iconSize,
              isChatPage: isChatPage,
              fontW: fontW,
              isStatusPage: false,
            ),
          );
  }
}

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    Key? key,
    required this.isContactPage,
    required this.userModel,
    required this.iconSize,
    required this.isChatPage,
    required this.fontW,
    required this.isStatusPage,
  }) : super(key: key);

  final bool isContactPage;
  final UserModel userModel;
  final double? iconSize;
  final bool isChatPage;
  final bool isStatusPage;
  final FontWeight? fontW;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: isContactPage ? 15 : 4,
          leading: CircularAvatarWidget(
            userModel: userModel,
            radiusOfAvatar: iconSize ?? 25,
            isChatPage: isChatPage,
            isContactPage: isContactPage,
            isStatusPage: isStatusPage,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userModel.name,
                style: TextStyle(
                  fontWeight:
                      (isContactPage || isStatusPage) ? fontW : FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              isChatPage
                  ? Text(
                      userModel.time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    )
                  : Container(),
            ],
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                userModel.isgroup
                    ? Text(
                        "${userModel.name}: ",
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    : isChatPage
                        ? const Icon(
                            Icons.done_all_rounded,
                            size: 17,
                          )
                        : Container(),
                isChatPage
                    ? Text(
                        userModel.message!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      )
                    : Container(),
                isContactPage
                    ? userModel.status != null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: Text(
                              userModel.status!,
                              maxLines: 1,
                            ))
                        : Container()
                    : Container(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CircularAvatarWidget extends StatelessWidget {
  const CircularAvatarWidget(
      {Key? key,
      required this.userModel,
      required this.radiusOfAvatar,
      required this.isChatPage,
      required this.isStatusPage,
      required this.isContactPage})
      : super(key: key);
  final double radiusOfAvatar;
  final bool isChatPage;
  final bool isContactPage;
  final bool isStatusPage;

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusOfAvatar,
      foregroundColor: Theme.of(context).primaryColor,
      backgroundColor: const Color.fromARGB(255, 218, 218, 218),
      // backgroundImage: NetworkImage(userModel[i].avatarUrl),

      child: Stack(clipBehavior: Clip.hardEdge, children: [
        Icon(
          userModel.isgroup ? Icons.group_rounded : Icons.person,
          color: Colors.white,
          size: 40,
        ),
      ]),

      // :SvgPicture.asset("assets/svgs/person.svg", color: const Color.fromARGB(255, 207, 207, 207), width: 32,height: 32,),
    );
  }
}
