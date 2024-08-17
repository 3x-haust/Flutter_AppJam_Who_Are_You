import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddFriendsState createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
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
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '친구추가',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/leftarrow.svg',
                    width: 24,
                    height: 24,
                    alignment: Alignment.centerRight,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Image.asset(
                'assets/images/searchBar.png'
              ),
            ),
            const SizedBox(height: 22,),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Image.asset(
                'assets/images/friendBar.png'
              ),
            ),
            const SizedBox(height: 14,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/friendpage');
              },
              child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Image.asset(
                'assets/images/friends.png'
              ),
              ),
            ),
            const SizedBox(height: 14,),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Image.asset(
                'assets/images/recommendBar.png'
              ),
            ),
            const SizedBox(height: 14,),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Image.asset(
                'assets/images/recommendFriends.png'
              ),
            ),
          ],
        ),
      )
    );
  }
}