import 'package:flutter/material.dart';
import 'package:personal_token_tracker/utils/enums.dart';
import 'package:personal_token_tracker/utils/util_logic.dart';
import 'package:personal_token_tracker/view/home_tap_controller_screen.dart';
import 'package:personal_token_tracker/widget/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff2A1363), Color(0xff481162)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Image.asset("assets/imgs/splash.png"),
            ),
            const Text(
              "Convert cash into",
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                "crypto, simply",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            const Text(
              "Connect your bank account and get ",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
            ),
            const Text(
              "access to more than 76000 crypto",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
            ),
            const Text(
              " currencies and tokens.",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
            ),
            const Spacer(),
            SizedBox(
              height: size.height * 0.12,
              child: Consumer<UtilLogic>(
                builder: (context, utilLogic, child) => CustomButton(
                  buttonName: "Lesggo",
                  textStyle: const TextStyle(
                      color: Color(0xffFFFFFF), fontWeight: FontWeight.bold),
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  onPressed: () {
                    // print("d");
                    utilLogic.setLoadingState(LoadingState.loading);
                    Future.delayed(const Duration(seconds: 2), () {
                      utilLogic.setLoadingState(LoadingState.intial);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeTapController(),
                          ));
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
      // body: ,
    ));
  }
}
