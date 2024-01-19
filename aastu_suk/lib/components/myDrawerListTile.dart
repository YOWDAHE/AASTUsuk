import 'package:flutter/material.dart';

class MyDrawerListTile extends StatelessWidget {
  const MyDrawerListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey.shade600,
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}
