import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/home.dart';
// import 'package:whatsapp/pages/camera.dart';


late List<CameraDescription> cameras = [];
late bool cameratab = false;
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
      ));
  try{
    cameras = await availableCameras();
  }on CameraException catch (e) {
   print(e);
  }

  runApp(const WhatsApp());
}
class WhatsApp extends StatelessWidget {
  const WhatsApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "WhatsApp",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 9, 125, 101),
        ),
        primaryColor: const Color(0xff075E54),
    //     textTheme: GoogleFonts.openSansTextTheme(
    //     Theme.of(context).textTheme,
    // ),
        // colorSchemeSeed : const Color(0xff128c7E),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff25D366), primary: const Color.fromARGB(255, 9, 125, 101)),
      ),
      
      home: const WhatsAppHome(),
      
    );
  }
}