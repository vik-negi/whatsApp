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
  List<String> items = [
    "Share",
    "Edit",
    "View in address book",
    "Verify security code",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 25,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          InkWell(
            child: CircularAvatarWidget(
              isContactPage: true,
              isChatPage: false,
              userModel: widget.userModel,
              radiusOfAvatar: 20,
              isStatusPage: false,
            ),
          ),
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
    );
  }
}
