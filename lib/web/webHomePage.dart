import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/components/PopUpMenuBtn.dart';
import 'package:whatsapp/components/appBarActionBtn.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/chat.dart';
import 'package:whatsapp/pages/status.dart';
import 'package:whatsapp/pages/userChatPage.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage(
      {Key? key, required this.userModel, required this.sourceChat})
      : super(key: key);
  final UserModel sourceChat;
  final List<UserModel> userModel;

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  List<String> homePagePopUpMenu = [
    "New group",
    "New broadcast",
    "Linked device",
    "Starred messages",
    "Payment",
    "Setting",
  ];
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: [
          Column(
            children: [
              Container(
                // color: Color(0xff3b4a54),
                height: userModel.length * 80,
                width: 400,
                child: Material(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularAvatarWidget(
                              userModel: widget.sourceChat,
                              radiusOfAvatar: 22,
                              isChatPage: false,
                              isStatusPage: true,
                              isContactPage: false,
                            ),
                            Row(children: [
                              Stack(
                                children: [
                                  AppBarActionBtn(
                                    iconName: Icons.circle_outlined,
                                    color: Colors.grey.shade600,
                                    iconSize: 25,
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Icon(Icons.circle,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        size: 10),
                                  ),
                                ],
                              ),
                              AppBarActionBtn(
                                iconName: Icons.message,
                                color: Colors.grey[600],
                                iconSize: 25,
                              ),
                              PopupMenuBtn(items: homePagePopUpMenu)
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        color: Colors.white,
                        height: 55,
                        child: Row(
                          children: [
                            Container(
                              width: 350,
                              // height: 40,
                              color: Colors.white,
                              child: const CupertinoSearchTextField(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 40),
                                backgroundColor:
                                    Color.fromARGB(255, 240, 242, 245),
                                placeholder: "Search or start new text",
                                placeholderStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Icon(Icons.bar_chart)
                          ],
                        ),
                      ),
                      Container(height: 1, color: Colors.grey.withOpacity(0.3)),
                      // Scaffold(
                      // body:
                      // Scrollbar(
                      // controller: scrollController,
                      // child:
                      // Container(
                      // height: userModel.length * 80,
                      // child:
                      Container(
                        height: 800,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Container(
                            height: 800,
                            // userModel.length * 90,
                            child: Chats(
                              userModelChat: widget.userModel,
                              sourceChat: widget.sourceChat,
                              isWeb: true,
                              controller: scrollController,
                            ),
                          ),
                        ),
                      ),
                      // ),
                      // ),
                      // )
                    ],
                  ),
                  // ),
                ),
              ),
              // ),
            ],
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: constraints.maxWidth - 400,
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: UserChatPage(
                  sourceChat: widget.sourceChat,
                  userModel: widget.userModel[1],
                  isWeb: true,
                ),
              ))
        ],
        //   ),
        // ),
      );
    });
  }
}
