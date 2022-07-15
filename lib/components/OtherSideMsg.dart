import 'package:flutter/material.dart';

class OtherSideMsgCard extends StatelessWidget {
  OtherSideMsgCard({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color:Colors.white,
          margin: const EdgeInsets.only(top: 15, left: 15),
          child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: ((text.length%47))<38?10:25,
                    left: 10,
                    right: text.length>37?20:75,
                  ),
                  child: Text(
                    text, style: TextStyle(fontSize: 16,),)
                ),
                text.length>30?const SizedBox(width: 45,):const SizedBox(width:0),
              const Positioned(
                bottom: 4,
                right: 10,
                child: Text("5:25 pm",overflow: TextOverflow.ellipsis,
                  softWrap: false, style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
              ),
              ],
            ),
          ),
        ),
    );
  }
}