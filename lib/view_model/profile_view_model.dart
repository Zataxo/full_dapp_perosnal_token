import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:personal_token_tracker/utils/contract_linking.dart';
import 'package:personal_token_tracker/utils/enums.dart';

class ProfileViewModel extends ChangeNotifier {
  ContractLinking link = ContractLinking();
  BigInt? ownerBalance;
  LoadingState state = LoadingState.intial;
  void setLoadingState(LoadingState _state) {
    state = _state;
    notifyListeners();
  }

  Future<void> fetchProfile() async {
    await link.intialize();
    setLoadingState(LoadingState.loading);
    try {
      final response = await link.client.call(
        contract: link.contract,
        function: link.ownerBalance,
        params: [link.ownerEthAddress],
      );

      // print(response[0]);
      ownerBalance = response[0];
    } catch (e) {
      log(e.toString());
    }
    setLoadingState(LoadingState.loaded);
    setLoadingState(LoadingState.intial);
  }
}
