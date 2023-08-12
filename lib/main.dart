import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:personal_token_tracker/utils/contract_linking.dart';
import 'package:personal_token_tracker/utils/util_logic.dart';
import 'package:personal_token_tracker/view/home_screen.dart';
import 'package:personal_token_tracker/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

import 'view_model/transactions_view_model.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UtilLogic(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContractLinking(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionsViewModel(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
