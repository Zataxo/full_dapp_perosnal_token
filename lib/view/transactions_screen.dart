import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(
                    color: Color(0xff171532),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 10,
                    itemBuilder: (context, index) => _buildTransaction()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTransaction() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "From : ",
                style: TextStyle(
                  color: Color(0xff171532),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "To : ",
                  style: TextStyle(
                    color: Color(0xff171532),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("0x47rh3h983u8g4g54"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("03fj84h93fjc094j"),
              ),
            ],
          ),
          const Text(
            "5,000,000 ZTX",
            style: TextStyle(
              color: Color(0xff171532),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
