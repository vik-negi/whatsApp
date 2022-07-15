import 'package:flutter/material.dart';
import 'package:whatsapp/components/PopUpMenuBtn.dart';
import 'package:whatsapp/components/textFormField.dart';
import 'package:whatsapp/pages/camera.dart';
import 'package:whatsapp/pages/chat.dart';
import 'package:whatsapp/pages/status.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({Key? key}) : super(key: key);

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  // static const List<Tab> tabsList = <Tab>[
  //   Tab(icon: Icon(Icons.camera_alt),),
  //   Tab(text: "CHATS",),
  //   Tab(text: "STATUS",),
  //   Tab(text: "CALLS",),
  // ];

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

  @override
  Widget build(BuildContext context) {
    // widthSize = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar:  
          // PreferredSize(
            // preferredSize: const Size.fromHeight(75),
            // child: Visibility(
              // visible: true,
              // child: 
              AppBar(
                title: const Text("WhatsApp"),
                elevation: 0,
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  PopupMenuBtn(items: homePagePopUpMenu)
                  // Icon(Icons.menu),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  labelPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  tabs: <Widget>[
                    Container(
                          width: MediaQuery.of(context).size.width*0.1,
                          child: const Tab(
                            child: Icon(Icons.camera_alt)
                            ),
                        ),
                    Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          alignment: Alignment.center,
                          child:  Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                              Text("CHATS"),
                              SizedBox(width: 4,),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: Text("11", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                              )
                            ]),
                            ),
                        ),
                    Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          child: const Tab(
                            child: Text("STATUS"),
                            ),
                        ),
                    Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          child: const Tab(
                            child: Text("CALLS"),
                            ),
                        ),
                  ],
                ),
              ),
          //   ),
          // ),
          // :PreferredSize(
            // preferredSize: Size.fromHeight(0),
            // child: AppBar(toolbarHeight: 0,)),
          body:  TabBarView(
            controller: _tabController,
            children: [
            Camera(),
            Chats(),
            Status(),
            Hii(),
          ])
          
          ),
    );
  }

}
