import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> with SingleTickerProviderStateMixin {
  bool _isImageOnLeft = false;
  late AnimationController _controller;
  bool _isPopupVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePosition() {
    setState(() {
      _isImageOnLeft = !_isImageOnLeft;
      _controller.forward(from: 0);
    });
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
                  '친구프로필',
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
      body: Column(
        children: [
          Center(
            child: Container(
              width: 361,
              height: 181,
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: _isImageOnLeft ? const Color(0xFFE7E7E7) : const Color(0xFF0061FF),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    left: _isImageOnLeft ? 25 : 190,
                    top: 30,
                    child: GestureDetector(
                      onTap: _togglePosition,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        backgroundImage: _isImageOnLeft
                            ? const AssetImage('assets/images/profile4.png')
                            : const AssetImage('assets/images/profile3.png'),
                      ),
                    ),
                  ),
                  if (_controller.value == 0 || _controller.value == 1)
                    Positioned(
                      left: _isImageOnLeft ? 166 : 30,
                      right: _isImageOnLeft ? 20 : 120,
                      top: 20,
                      child: _buildProfileInfo(),
                    ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/full.svg',
                        width: 18,
                        height: 18,
                        color: _isImageOnLeft ? Colors.black : Colors.white,
                      ),
                      onPressed: (){ Get.toNamed('/profilecard');}
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 34),
          SizedBox(
            width: 325,
            height: 366,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 700,
                child: _isImageOnLeft ? _generalInfo() : _businessInfo(),
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _businessInfo() {
    return const Stack(
      children: [
        Positioned(
          top: 1,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '자기소개',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 420,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '부가 설명',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 282,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '자격증',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 23,
          child: SizedBox(
            width: 296,
            height: 100,
            child: Text(
              '안녕하세요~! 저는 다양한 활동을 통해 성장과 경험을 쌓아가고 있는 최유리입니다. ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 442,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '사용 가능 툴 Photoshop, Illustration, InDesign, Premiere Pro, After Effects, 3D Max 등',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 460,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              'CW.M.V(영상) 동아리 차장',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 478,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '청소년문화의집소속 WASS(디자인/영상)동아리 부장',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 303,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.04.16] ITQ 파워포인트/한글/엑셀 A',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 322,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.07.15] GTQ 포토샵 1급',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 339,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.09.23] ACP 포토샵',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 357,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.11.09] ACP 프리미어프로',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 129,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '수상 경력',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.04.25.] 크리에이터 사진/영상 공모전 최우수상',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 169,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.07.12.] 창체우수 활동상 최우수상',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 186,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.09.07.] 전국환경부 환경 보호 공모전 장려상',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 205,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.12.05.] 나의 꿈 발표 대회 최우수상',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 224,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[24.07.19.] 경진 대회 최우수상(수학, 문해력)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 241,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[24.08.09.] 직업계고 학점제 공모전 우수상 (v-log 부문)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _generalInfo() {
    return const Stack(
      children: [
        Positioned(
          top: 1,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '자기소개',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 265 ,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '부가 설명',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 180,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '취미 및 특기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 23,
          child: SizedBox(
            width: 300,
            height: 200,
            child: Text(
              '안녕하세요! 새로운 사람들을 만나고 다양한 경험을 쌓는 것을 좋아하는 최유리입니다. 저는 수줍음이 많지만 활기차고 호기심이 넘치는 편이에요. 특히, 사람들과의 대화를 통해 서로의 생각을 나누고 배울 수 있는 기회를 소중히 여기며, 항상 열린 마음으로 소통하려고 합니다.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 287,
          child: SizedBox(
            width: 325,
            height: 16,
            child: Text(
              '에이티즈 좋아함',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 305,
          child: SizedBox(
            width: 325,
            height: 16,
            child: Text(
              '요즘 발로란트 시작함',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 200,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '사진 찍기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 219,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '일 벌리기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 236,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '즉흥 여행 떠나기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 129,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              'MBTI',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              'ENTP',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최유리',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '2007. 06. 09.',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        Text(
          '010-8353-7329',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        Text(
          'choiur0424@naver.com',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        Text(
          '@yuyuri07',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
      ],
    );
  }
}
