import "package:flutter/material.dart";
import "dart:io";
import 'package:whatsapp/components/appBarActionBtn.dart';
import 'package:whatsapp/pages/chat.dart';
import 'package:video_player/video_player.dart';

class CameraViewPage extends StatefulWidget {
  final String path;
  final bool isCamera;

  const CameraViewPage({
    Key? key,
    required this.path,
    required this.isCamera,
  }) : super(key: key);

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  late VideoPlayerController _controller;
  bool playPauseBtn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        playPauseBtn = false;
      });
    });
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          const AppBarActionBtn(
            iconName: Icons.crop_rotate,
            iconSize: 27,
          ),
          IconButton(
              onPressed: () {
                print("sndn");
              },
              icon: const Icon(Icons.ac_unit)),
          const AppBarActionBtn(
            iconName: Icons.emoji_emotions,
            iconSize: 27,
          ),
          const AppBarActionBtn(
            iconName: Icons.title,
            iconSize: 27,
          ),
          const AppBarActionBtn(
            iconName: Icons.edit,
            iconSize: 27,
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 162,
              child: widget.isCamera
                  ? Image.file(
                      File(widget.path),
                      fit: BoxFit.cover,
                    )
                  : _controller.value.isInitialized
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              playPauseBtn = !playPauseBtn;
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        )
                      : Container(),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 228, 228, 228),
                          ),
                          width: MediaQuery.of(context).size.width * 0.82,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: AppBarActionBtn(
                                  iconName: (Icons.photo_library_outlined),
                                  // ontapAction: Chats(),
                                ),
                                suffixIcon: AppBarActionBtn(
                                  iconName: Icons.check_circle_outline_sharp,
                                ),
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Add a caption..."),
                          ),
                        ),
                        const CircleAvatar(
                            backgroundColor: Colors.teal,
                            radius: 25,
                            child: Icon(
                              Icons.send,
                              size: 20,
                            ))
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 15),
                          Text(" hello",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            playPauseBtn
                ? Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black12,
                      child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 50),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
