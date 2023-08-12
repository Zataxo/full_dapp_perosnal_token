import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:personal_token_tracker/utils/contract_linking.dart';
import 'package:personal_token_tracker/utils/enums.dart';
import 'package:web3dart/web3dart.dart';

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

  Future<void> transfer() async {
    // static params to check if the operation goes well
    await link.intialize();
    setLoadingState(LoadingState.loading);

    try {
      final toEthAddress =
          EthereumAddress.fromHex("0x0bCe164b3D697e9Bb1B2Ee7651d06E90C18967f9");
      print(link.ownerAddress);
      print(link.ownerEthAddress);
      final txHash = await link.client.sendTransaction(
          link.credentials,
          Transaction.callContract(
              from: EthereumAddress.fromHex(link.ownerAddress),
              contract: link.contract,
              function: link.transfer,
              parameters: [
                // link.ownerEthAddress,
                toEthAddress,
                BigInt.from(1000000)
              ]),
          chainId: 11155111);
      print(txHash);
      setLoadingState(LoadingState.loaded);
      setLoadingState(LoadingState.intial);
    } catch (e) {
      log(e.toString());
    }
  }
}
