import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:whatsapp/components/PopUpMenuBtn.dart';
import 'package:whatsapp/components/textFormField.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/camera.dart';
import 'package:whatsapp/pages/chat.dart';
import 'package:whatsapp/pages/status.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome(
      {Key? key, required this.userModel, required this.sourceChat})
      : super(key: key);
  final List<UserModel> userModel;
  final UserModel sourceChat;

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<String> homePagePopUpMenu = [
    "New group",
    "New broadcast",
    "Linked device",
    "Starred messages",
    "Payment",
    "Setting",
  ];
  // late double widthSize;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  int contrr = 1;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
        body: DefaultTabController(
            length: 4,
            child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      title: const Text("WhatsApp"),
                      elevation: 0,
                      pinned: true,
                      floating: true,
                      actions: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                        PopupMenuBtn(items: homePagePopUpMenu)
                        // Icon(Icons.menu),
                      ],
                      bottom: TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        indicatorColor: Colors.white,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        tabs: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: const Tab(child: Icon(Icons.camera_alt)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            alignment: Alignment.center,
                            child: Tab(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("CHATS"),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white,
                                      child: Text("11",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Tab(
                              child: Text("STATUS"),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Tab(
                              child: Text("CALLS"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(controller: _tabController, children: [
                  const Camera(),
                  Chats(
                    userModelChat: widget.userModel,
                    sourceChat: widget.sourceChat,
                    isWeb: false,
                    controller: controller,
                  ),
                  Status(
                    userModelChat: widget.userModel,
                    sourceChat: widget.sourceChat,
                  ),
                  const Hii(),
                ]))));
    // }
    // ),
    // )
    // );
  }
}
