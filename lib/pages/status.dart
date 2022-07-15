import 'package:flutter/material.dart';
import 'package:whatsapp/main.dart';

class Status extends StatefulWidget {
  const Status({ Key? key }) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      cameratab = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child : const Text("Status"),
      ),
    );
  }
}