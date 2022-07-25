import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, this.width = 70.0, this.height = 70.0})
      : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        border: Border.all(color: Colors.white),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(""),
        ),
      ),
    );
  }
}
