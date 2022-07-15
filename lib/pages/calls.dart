import 'package:flutter/material.dart';
import 'package:whatsapp/main.dart';

class Calls extends StatefulWidget {
  const Calls({ Key? key }) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child : const Text("Calls"),
    );
  }
}