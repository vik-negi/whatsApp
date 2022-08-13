import 'package:flutter/material.dart';

class AppBarActionBtn extends StatelessWidget {
  final Widget ?ontapAction;
  final IconData iconName;
  final double? iconSize;

  const AppBarActionBtn({
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
