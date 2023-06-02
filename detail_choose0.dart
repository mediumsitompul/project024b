import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailChoose extends StatefulWidget {
  DetailChoose({super.key, required this.idx});
  String idx;

  @override
  State<DetailChoose> createState() => _DetailChooseState();
}

class _DetailChooseState extends State<DetailChoose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.idx)),
    );
  }
}
