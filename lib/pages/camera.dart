import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp/main.dart';
import 'package:whatsapp/pages/cameraView.dart';

// late List<CameraDescription> cameras;

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _cameraController;
  late Future<void> cameraValus;
  bool isRecording = false;
  double transform = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.veryHigh);
    cameraValus = _cameraController.initialize();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  bool flash = false;
  bool isFrontCamera = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Stack(
          children: [
            FutureBuilder(
                future: cameraValus,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            Positioned(
                bottom: 0.0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black87,
                    child: Column(
                      children: [
                        // ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   children: [
                        //   Container(
                        //     height: 45,
                        //     width: 55,
                        //     color: Colors.white38,
                        //   ),
                        // ],),
                        // ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: 10,
                        //   itemBuilder: ((context, index) {
                        //   return Container(
                        //      height: 45,
                        //     width: 55,
                        //     color: Colors.white38,
                        //     child: Text("a"),
                        //   );
                        // }),),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      flash = !flash;
                                    });
                                    flash
                                        ? _cameraController
                                            .setFlashMode(FlashMode.torch)
                                        : _cameraController
                                            .setFlashMode(FlashMode.off);
                                  },
                                  icon: Icon(
                                    flash ? Icons.flash_on : Icons.flash_off,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onLongPress: () async {
                                    setState(() {
                                      isRecording = true;
                                    });
                                    await _cameraController
                                        .prepareForVideoRecording();
                                    await _cameraController
                                        .startVideoRecording();
                                  },
                                  onLongPressUp: () async {
                                    final videoPath = join(
                                        (await getTemporaryDirectory()).path,
                                        "${DateTime.now()}.mp4");
                                    final video = await _cameraController
                                        .stopVideoRecording();
                                    video.saveTo(videoPath);
                                    setState(() {
                                      isRecording = false;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                CameraViewPage(
                                                  path: videoPath,
                                                  isCamera: false,
                                                )));
                                  },
                                  onTap: () {
                                    if (!isRecording) {
                                      takePhoto(context);
                                    }
                                  },
                                  child: !isRecording
                                      ? const Icon(
                                          Icons.panorama_fish_eye,
                                          size: 85,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.radio_button_on,
                                          color: Colors.red,
                                          size: 85,
                                        ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFrontCamera = !isFrontCamera;
                                      transform = -1*transform;
                                      flash = !flash;
                                    });
                                    int cameraPos = isFrontCamera?1:0;
                                    _cameraController = CameraController(cameras[cameraPos], ResolutionPreset.veryHigh);
                                    cameraValus = _cameraController.initialize();
                                  },
                                  icon: Transform.scale(
                                    scaleX : transform,
                                    child: const Icon(
                                      Icons.flip_camera_ios,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text(
                            "Hold for Video, tap for photo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");

    XFile picture = await _cameraController.takePicture();
    picture.saveTo(path);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: path,
                  isCamera: true,
                )));
  }
}
