import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isBusiness = true; // 상태를 클래스 멤버 변수로 이동

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    isBusiness = false;
                  }),
                  child: Text(
                    '일반',
                    style: TextStyle(
                      color: !isBusiness ? Colors.black : const Color(0xFFADADAD),
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => setState(() {
                    isBusiness = true;
                  }),
                  child: Text(
                    '비즈니스',
                    style: TextStyle(
                      color: isBusiness ? Colors.black : const Color(0xFFADADAD),
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/addfriends.svg',
                  width: 24,
                  height: 24,
                  color: const Color(0xFFADADAD),
                ),
                onPressed: () {
                  Get.toNamed('/addfriends');
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 20),
            child: Image.asset(
              isBusiness ? 'assets/images/chat1.png' : 'assets/images/chat2.png',
            ),
          ),
        ],
      ),
    );
  }
}
