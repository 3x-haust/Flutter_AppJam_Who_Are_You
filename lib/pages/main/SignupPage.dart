import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Center(
          child: SizedBox(
            width: 74,
            height: 25,
            child: Text(
              '회원가입',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        )
      ),
      body: GestureDetector(
        onTap: () {
          Get.toNamed('/');
        },
        child: Center(
          child: Image.asset(
            width: 1000,
            height: 1000,
            'assets/images/signup.png',
          ),
        )
      )
    );
  }
}