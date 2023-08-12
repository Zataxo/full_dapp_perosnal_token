import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_token_tracker/dialog/send_dialog.dart';
import 'package:personal_token_tracker/utils/util_funcs.dart';
import 'package:personal_token_tracker/view/home_screen.dart';
import 'package:personal_token_tracker/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final channel = IOWebSocketChannel.connect(
  //     "-");
  // @override
  // void initState() {
  //   // print("object");
  //   streamListener();
  //   super.initState();
  // }

  // streamListener() {
  //   print("Heelo");

  //   channel.stream.listen((event) {
  //     print("---------");
  //     print(event);
  //     print("---------");
  //   });
  // }

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
                Positioned(
                    top: 85,
                    left: 35,
                    child: Selector<ProfileViewModel, BigInt?>(
                        selector: (context, valueToLsit) =>
                            valueToLsit.ownerBalance,
                        builder: (context, value, child) {
                          final temp = value ??
                              BigInt.from(0) / BigInt.from(pow(10, 18));
                          return Text(
                            formatCurrency(currency: temp.toString()),
                            style: const TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          );
                        })),
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
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => const MintDialog()),
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
                      onTap: () => print("object"),
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
