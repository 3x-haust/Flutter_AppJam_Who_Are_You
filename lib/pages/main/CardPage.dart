import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Transform.rotate(
        angle: -3.14 / -2,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Image.asset(
              width: 1000,
              height: 1000,
              'assets/images/card.png',
            ),
          )
        )
      )
    );
  }
}