import 'package:flutter/material.dart';
import 'package:whatsapp/data/UserInfo.dart';
import 'package:whatsapp/models/chat_model.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  List<UserModel> group = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            children: const [
              Text("New group",
                  style: TextStyle(
                      // fontSize:
                      )),
              Text("Add participants",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400))
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ]),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: userModel.length + 1,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return Container(
                    height: group.isEmpty ? 0 : 90,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (userModel[i - 1].select == false) {
                      setState(() {
                        userModel[i - 1].select = true;
                        group.add(userModel[i - 1]);
                      });
                    } else {
                      setState(() {
                        userModel[i - 1].select = false;
                        group.remove(userModel[i - 1]);
                      });
                    }
                  },
                  child: userContact(userModel[i - 1]),
                );
              }),
          group.isNotEmpty
              ? Column(
                  children: [
                    Container(
                        height: 95,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: userModel.length,
                            itemBuilder: (context, i) {
                              if (userModel[i].select == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      userModel[i].select = false;
                                      group.remove(userModel[i]);
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 9),
                                        width: 67,
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.blueGrey,
                                              // child: SvgPicture.asset("assets/svgs/person.svg", height: 30,width:30, color: Colors.white),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                clipBehavior: Clip.hardEdge,
                                                child: Image.asset(userModel[i]
                                                        .avatarUrl ??
                                                    "assets/svgs/person.svg"),
                                              ),
                                              // Icon(
                                              // Icons.person,
                                              // color: Colors.white,
                                              // size: 45,
                                              // )
                                            ),
                                            const Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: CircleAvatar(
                                                  radius: 13,
                                                  backgroundColor: Colors.white,
                                                  child: CircleAvatar(
                                                    radius: 11,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Icon(Icons.clear,
                                                        size: 18,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: userModel[i]
                                                .name
                                                .split(' ')[0]),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            })),
                    Container(height: 2, color: Colors.grey[200]),
                    // const Divider(thickness: 2,)
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  userContact(UserModel userModel) {
    return SizedBox(
      height: 64,
      child: ListTile(
        minVerticalPadding: 0,
        leading: SizedBox(
          // color: Colors.black,
          height: 48,
          width: 45,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey[200],
                // child: SvgPicture.asset("assets/svgs/person.svg", height: 30,width:30, color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                      userModel.avatarUrl ?? "assets/svgs/person.svg"),
                ),
              ),
              // const Icon(Icons.person, color: Colors.white)),
              if (userModel.select != null && userModel.select == true)
                const Positioned(
                    bottom: 2,
                    right: 3,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.check, size: 18, color: Colors.white),
                    ))
              else
                Container(),
            ],
          ),
        ),
        title: Text(
          userModel.name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        subtitle: Text.rich(
          TextSpan(text: userModel.status ?? ""),
          maxLines: 1,
          softWrap: false,
        ),
      ),
    );
  }
}
