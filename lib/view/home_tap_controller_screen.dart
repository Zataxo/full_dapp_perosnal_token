import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:personal_token_tracker/view/profile_screen.dart';
import 'package:personal_token_tracker/view/transactions_screen.dart';

class HomeTapController extends StatefulWidget {
  const HomeTapController({Key? key}) : super(key: key);

  @override
  State<HomeTapController> createState() => _HomeTapControllerState();
}

class _HomeTapControllerState extends State<HomeTapController> {
  final List<Widget> screenList = [
    const ProfileScreen(),
    const TransactionScreen()
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: const LinearGradient(colors: [
                      Color(0xff8462E1),
                      Color(0xff55389B),
                      Color(0xff351B6F)
                    ])),
                padding: const EdgeInsets.all(12.0),
                child: const Icon(Icons.swap_horiz_outlined),
              ),
              onPressed: () {
                _bottomNavIndex == 0
                    ? _bottomNavIndex = 1
                    : _bottomNavIndex = 0;
                setState(() {});
                // setState(() {});
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: const [Icons.credit_card_outlined, Icons.list],
              activeIndex: _bottomNavIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              activeColor: const Color(0xffD975BB),
              inactiveColor: const Color(0xffFFFFFF),
              onTap: (index) {
                print(index);
                setState(() => _bottomNavIndex = index);
              },
              backgroundColor: const Color(0xff261863),

              //other params
            ),
            backgroundColor: const Color(0xffFFFFFF),
            body: screenList[_bottomNavIndex]));
  }
}
