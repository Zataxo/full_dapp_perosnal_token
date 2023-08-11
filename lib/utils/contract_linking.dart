import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  static const String tokenContractName = "ZataxToken";

  static final String _networkUrl = dotenv.env['INFURA_SEPOIL_ENDPOINT']!;
  static final String _webSocketUrl = dotenv.env['INFURA_WEB_SOCKET']!;
  static final _walletPrivateKey = dotenv.env['PRIVATE_KEY'];
  static final _contractAddressString = dotenv.env['CONTRACT_ADDRESS'];

  late Web3Client client;
  late Credentials credentials;
  late DeployedContract contract;

  late ContractFunction ownerBalance;
  late ContractFunction totalSupply;
  late ContractFunction transactions;
  late EthereumAddress ownerEthAddress;
  late String ownerAddress;

  intialize() async {
    client = Web3Client(
      _networkUrl,
      Client(),
      socketConnector: () =>
          IOWebSocketChannel.connect(_webSocketUrl).cast<String>(),
    );
    credentials = EthPrivateKey.fromHex(_walletPrivateKey!);

    final abiStringFile = await rootBundle.loadString(
        "artifacts/contracts/$tokenContractName.sol/$tokenContractName.json");
    // print("object");
    // print(abiStringFile);
    final abiJson = jsonDecode(abiStringFile);
    final abi = jsonEncode(abiJson["abi"]);
    final contractAddress = EthereumAddress.fromHex(_contractAddressString!);
    contract = DeployedContract(
        ContractAbi.fromJson(abi, tokenContractName), contractAddress);
    ownerEthAddress = await credentials.extractAddress();
    ownerAddress = ownerEthAddress.toString();

    // Listing my token functions
    totalSupply = contract.function("totalSupply");
    ownerBalance = contract.function("balanceOf");
    notifyListeners();
  }
}
