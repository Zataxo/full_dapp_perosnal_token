import 'package:flutter/material.dart';
import 'package:personal_token_tracker/dialog/mint_dialog.dart';
import 'package:personal_token_tracker/view/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hello Hassan",
                style: TextStyle(color: Color(0xffD975BB)),
              ),
              RotatedBox(
                quarterTurns: 90,
                child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Color(0xff7056B2),
                    )),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       "Weclome Back!",
          //       style: TextStyle(
          //           color: Color(0xff171532), fontWeight: FontWeight.w500),
          //     ),
          //     IconButton(
          //         onPressed: () {},
          //         icon: const RotatedBox(
          //           quarterTurns: 90,
          //           child: Icon(
          //             Icons.logout_outlined,
          //             color: Color(0xff7056B2),
          //           ),
          //         )),
          //   ],
          // ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/imgs/bg.png",
                  ),
                ),
                const Positioned(
                    top: 55,
                    left: 45,
                    child: Text(
                      "0.5 % Today",
                      style: TextStyle(color: Color(0xffD975BB)),
                    )),
                const Positioned(
                    top: 85,
                    left: 45,
                    child: Text(
                      "10,000,000 ZTX",
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    left: 0,
                    child: Text(
                      "Actions",
                      style: TextStyle(
                          color: Color(0xff171532),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => print("send"),
                      child: Image.asset(
                        "assets/imgs/mint.png",
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 130,
                      right: 80,
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => const MintDialog()),
                      child: Image.asset(
                        "assets/imgs/send.png",
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 130,
                      left: 10,
                      child: Text(
                        "Import",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Note",
                      style: TextStyle(
                          color: Color(0xff171532),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "ZTX Token uses Proof of stake Consensus Alogarithm",
                        style: TextStyle(
                            color: Color(0xff171532),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    )));
  }
}
