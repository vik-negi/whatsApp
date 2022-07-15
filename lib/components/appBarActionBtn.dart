import 'package:flutter/material.dart';

class AppBarActionBtn extends StatelessWidget {
  Widget ?ontapAction;
  IconData iconName;
  double? iconSize;

  AppBarActionBtn({
    Key? key, 
    this.ontapAction, 
    required this.iconName,
    this.iconSize,
    })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ontapAction!;
      }, 
    icon: Icon(
      iconName,
      size: iconSize ??24.0,
    )
    );
  }
}
