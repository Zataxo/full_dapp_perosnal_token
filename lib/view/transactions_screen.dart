import 'package:flutter/material.dart';
import 'package:personal_token_tracker/model/transactions_model.dart';
import 'package:personal_token_tracker/utils/enums.dart';
import 'package:personal_token_tracker/view_model/transactions_view_model.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  // late final x = Provider.of<TransactionsViewModel>(context, listen: true);
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
                child: Consumer<TransactionsViewModel>(
                    builder: (context, value, child) {
                  if (value.state == LoadingState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: value.transactionsList.length,
                        itemBuilder: (context, index) =>
                            _buildTransaction(value.transactionsList[index]));
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTransaction(TransactionsModel _model) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Text(
            "From : ",
            style: TextStyle(
              color: Color(0xff171532),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(_model.from, style: const TextStyle(fontSize: 12)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "To : ",
              style: TextStyle(
                color: Color(0xff171532),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              _model.to,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Text(
            "${_model.amount} ZTX",
            style: const TextStyle(
              color: Color(0xff171532),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
