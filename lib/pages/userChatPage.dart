import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/components/MoreOptionToSend.dart';
import 'package:whatsapp/components/OtherSideMsg.dart';
import 'package:whatsapp/components/OwnMsgCard.dart';
import 'package:whatsapp/components/PopUpMenuBtn.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/models/more_option_to_send.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class UserChatPage extends StatefulWidget {
  const UserChatPage(this.userModel, {Key? key}) : super(key: key);
  final UserModel userModel;

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  List<String> userChatMenuBtn = [
    "view contact",
    "Media, links, and docs",
    "Search",
    "Mute notifications",
    "Disappering messages",
    "Wallpaper",
    "More"
  ];
  List<MoreOption> moreOptionsToSend =[
    MoreOption(
      name : "Document",
      iconName : Icons.insert_drive_file,
      color : Colors.indigo
    ),
    MoreOption(
      name : "Document",
      iconName : Icons.insert_drive_file,
      color : Colors.indigo
    ),
    MoreOption(
      name : "Camera",
      iconName : Icons.camera_alt,
      color : Colors.pink
    ),
    MoreOption(
      name : "Audio",
      iconName : Icons.headset_rounded,
      color : Colors.orange
    ),
    MoreOption(
      name : "Payment",
      iconName : Icons.currency_rupee,
      color : Colors.teal
    ),
    MoreOption(
      name : "Location",
      iconName : Icons.location_pin,
      color : Colors.green
    ),
    MoreOption(
      name : "Contact",
      iconName : Icons.person,
      color : Colors.blue
    )
  ];

  bool showEnojiOption = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _txtController = TextEditingController();
  late IO.Socket socket;
  @override
  void initState() {
    super.initState();
    initSocket();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEnojiOption = false;
        });
      }
    });
  }

  Future <void> initSocket() async{
    try{
      socket = IO.io("http://172.11.10.228:5000",<String, dynamic>{
        "transports":["websocket"],
        "autoConnect": true,
      }
      );
      // socket.connect();
      socket.onConnect((data) => print("connected"));
      print(socket.connected);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/img/whatsappbg.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: userChatAppBar(context),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height ,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 140,
                    child: ListView(
                    children: [
                      OwnMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OtherSideMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OwnMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OtherSideMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OtherSideMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OwnMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OtherSideMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OwnMsgCard(text: "vhbj bij jnijo kni jbi vjb buj bjbiikrt fctgfyhgj hvh nidfcj jdncisd svndi"),
                      OtherSideMsgCard(text: "vhndi hry"),
                      OwnMsgCard(text: "vhbj bijnidfcj jdncisd svndi"),
                      OwnMsgCard(text: "vhbj bijnidfcj jdncisd svndi"),
                      OwnMsgCard(text: "vhbj bijnidfcj jdncisd svndi"),
                      OwnMsgCard(text: "vhbj bijnidfcj jdncisd svndi"),
                      OtherSideMsgCard(text: "vhndi hry"),
                      OtherSideMsgCard(text: "vhndi hry"),
                      OtherSideMsgCard(text: "vhndi hry"),
                    ],
                ),
                  ), 
                Positioned(child: BottomTextMessaging(context))
                ],
              ),
              onWillPop: () {
                if (showEnojiOption == true) {
                  setState(() {
                    showEnojiOption = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Align BottomTextMessaging(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 55,
                child: Card(
                  margin: const EdgeInsets.only(left: 4, right: 2, bottom: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    controller: _txtController,
                    focusNode: focusNode,
                    textAlignVertical: TextAlignVertical.center,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Message",
                      hintStyle: const TextStyle(fontSize: 18),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          size: 28,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          focusNode.unfocus();
                          focusNode.canRequestFocus = false;
                          setState(() {
                            showEnojiOption = !showEnojiOption;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (builder) {
                                    // return const MoreOptionsToSend();
                                    return Mots(height: 380, list: moreOptionsToSend,borderR: 15, );
                                  },
                                );
                              },
                              icon: const Icon(Icons.attach_file)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.currency_rupee)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xff128c7E),
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                ),
              ),
            ],
          ),
          showEnojiOption ? EmojiOptions() : Container(),
        ],
      ),
    );
  }

  SizedBox EmojiOptions() {
    return SizedBox(
      height: 250,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          setState(() {
            _txtController.text = _txtController.text + emoji.emoji;
          });
        },
        onBackspacePressed: () {},
        config: const Config(
          columns: 8,
          // emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          bgColor: Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          progressIndicatorColor: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          showRecentsTab: true,
          recentsLimit: 28,
          noRecents: Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL,
        ),
      ),
    );
  }

  AppBar userChatAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 75,
      toolbarHeight: 55,
      titleSpacing: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Icon(Icons.arrow_back),
            CircularAvatarWidget(
              isContactPage: true,
              isChatPage: false,
                userModel: widget.userModel, radiusOfAvatar: 22),
          ]),
        ),
      ),
      title: userChatTitle(),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        PopupMenuBtn(items: userChatMenuBtn)
      ],
    );
  }

  Padding userChatTitle() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.userModel.name,
              style:
                  const TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Last seen today at 5:04",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  // Widget sendFiles(){
  //   return ;
  // }
}


