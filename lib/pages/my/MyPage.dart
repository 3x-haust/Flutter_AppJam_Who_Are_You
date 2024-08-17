import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '마이페이지',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
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
                            ? const AssetImage('assets/images/profile2.png')
                            : const AssetImage('assets/images/profile.png'),
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
            child: Row(
              children: [
                Text(
                  '자기소개',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 253),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ),
        ),
        Positioned(
          top: 420,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Row(
              children: [
                Text(
                  '부가 설명',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 249),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ),
        ),
        Positioned(
          top: 282,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Row(
              children: [
                Text(
                  '자격증',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 267),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ),
        ),
        Positioned(
          top: 23,
          child: SizedBox(
            width: 296,
            height: 100,
            child: Text(
              '안녕하세요! 저는 웹 및 모바일 애플리케이션 개발에 열정을 가진 개발자 김지혜입니다. 최신 기술 트렌드에 관심이 많아 지속적으로 학습하며 성장하고 있으며, 저의 목표는 기술을 통해 사람들의 삶을 더욱 편리하고 즐겁게 만드는 것입니다. 함께 성장하며 도전할 수 있는 기회를 기대합니다.',
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
            height: 14,
            child: Text(
              'Java',
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
            height: 14,
            child: Text(
              'C',
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
            height: 14,
            child: Text(
              'Python',
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
            height: 14,
            child: Text(
              '[23.06.22] MOS Excel',
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
            height: 14,
            child: Text(
              '[23.11.07] MOS PowerPoint',
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
              '[24.07.18] Cos Pro 2급 python',
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
              '[24.08.22] 컴퓨터 활용능력 2급',
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
          top: 376,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[25.04.17] 정보처리 기능사',
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
            child: Row(
              children: [
                Text(
                  '수상 경력',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 249),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ),
        ),
        Positioned(
          top: 150,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Text(
              '[23.07.05.] 표창장(선행부문)',
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
              '[23.07.14.] 2023 창의아이디어경진대회 금상(1위)',
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
              '[23.07.14] 교과우수상(수학, 영어)',
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
              '[23.12.15.] 교과우수상(수학, 통합사회)',
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
              '[24.07.19.] 표창장(효행부문)',
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
              '[24.08.09.] 교과우수상(수학Ⅰ)',
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
            child: Row(
              children: [
                Text(
                  '자기소개',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 253),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ),
        ),
        Positioned(
          top: 265 ,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Row(
              children: [
                Text(
                  '부가 설명',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
            ),
                SizedBox(width: 249),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ),
        ),
        Positioned(
          top: 180,
          child: SizedBox(
            width: 325,
            height: 20,
            child: Row(
              children: [
                Text(
                  '취미 및 특기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 231),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ),
        ),
        Positioned(
          top: 23,
          child: SizedBox(
            width: 300,
            height: 200,
            child: Text(
              '안녕하세요! 저는 ESFJ 성격을 가진 김지혜입니다. 사람들과 어울리는 것을 정말 좋아해서 언제나 밝고 긍정적인 에너지를 주고받는 걸 중요하게 생각해요. 함께 있을 때 더 큰 시너지를 만들어가는 제가 되기를 바랍니다!',
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
              '00아이돌 좋아함',
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
              '00게임 골드',
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
              '기타 치면서 노래부르기',
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
              '악기 배우기',
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
              '수영하기',
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
            child: Row(
              children: [
                Text(
                  'MBTI',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 272),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
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
          '김지혜',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '2007. 05. 08.',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        Text(
          '010-5398-0292',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        Text(
          's2321@e-mirim.hs.kr',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
        Text(
          _isImageOnLeft ? '@todays_jh' : '@jihye058',
          style: TextStyle(
            color: _isImageOnLeft ? Colors.black : Colors.white,
          ),
        ),
      ],
    );
  }
}
