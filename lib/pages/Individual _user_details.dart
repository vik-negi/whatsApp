import 'package:flutter/material.dart';
import 'package:whatsapp/components/CustomUser.dart';
import 'package:whatsapp/components/PopUpMenuBtn.dart';
import 'package:whatsapp/models/chat_model.dart';

class IndividualUserDetails extends StatefulWidget {
  const IndividualUserDetails({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  final UserModel userModel;

  @override
  State<IndividualUserDetails> createState() => _IndividualUserDetailsState();
}

class _IndividualUserDetailsState extends State<IndividualUserDetails> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  List<String> items = [
    "Share",
    "Edit",
    "View in address book",
    "Verify security code",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            leadingWidth: 75,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CircularAvatarWidget(
                userModel: widget.userModel,
                radiusOfAvatar: 50,
                isChatPage: true,
                isStatusPage: false,
                isContactPage: false,
              ),
            ),
            leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 25,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                  // InkWell(
                  //   child: CircularAvatarWidget(
                  //     isContactPage: true,
                  //     isChatPage: false,
                  //     userModel: widget.userModel,
                  //     radiusOfAvatar: 20,
                  //     isStatusPage: false,
                  //   ),
                  // ),
                ]),
            actions: [
              IconButton(
                onPressed: () {
                  PopupMenuBtn(items: items);
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.userModel.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "+91 9821 547 542",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.call),
                          color: Theme.of(context).primaryColor,
                        ),
                        const Text(
                          "Audio",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
