// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, avoid_web_libraries_in_flutter, unused_import, prefer_const_constructors_in_immutables
import 'dart:html';

import 'package:flutter/material.dart';

class RouteButton extends StatelessWidget {
  RouteButton({
    Key? key,
    required this.title,
    required this.routeName,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String routeName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: ListTile(
          leading: Icon(Icons.ads_click_outlined),
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () {
            Navigator.of(context).pushNamed(routeName);
          }),
    );
  }
}
