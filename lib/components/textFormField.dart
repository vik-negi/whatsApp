import 'package:flutter/material.dart';

int no=0;
class Hii extends StatefulWidget {
  const Hii({Key? key}) : super(key: key);

  @override
  State<Hii> createState() => _HiiState();
}

class _HiiState extends State<Hii> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$no"),
          TextButton(onPressed: (){
            setState(() {
              no+=1;
            });
          }, child: const Text("Click here..")),
      ],
    );
  }
}