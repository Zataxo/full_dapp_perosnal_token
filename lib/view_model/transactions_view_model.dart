import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:personal_token_tracker/model/transactions_model.dart';
import 'package:personal_token_tracker/utils/contract_linking.dart';
import 'package:personal_token_tracker/utils/enums.dart';

class TransactionsViewModel extends ChangeNotifier {
  List<TransactionsModel> transactionsList = [];
  ContractLinking link = ContractLinking();
  LoadingState state = LoadingState.intial;
  void setLoadingState(LoadingState _state) {
    state = _state;
    notifyListeners();
  }

  Future<void> fetchTransactions() async {
    transactionsList.clear();
    await link.intialize();
    setLoadingState(LoadingState.loading);
    try {
      for (var i = 0; i < 4; i++) {
        final response = await link.client.call(
            contract: link.contract,
            function: link.transactions,
            params: [BigInt.from(i)]);
        // print(response);

        transactionsList.add(TransactionsModel(
            from: response[0].toString(),
            to: response[1].toString(),
            amount: response[2]));

        // print(response[0]);
        // print(response[1]);
        // print(response[2]);

      }
      print(transactionsList.length);
      setLoadingState(LoadingState.loaded);
      setLoadingState(LoadingState.intial);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
