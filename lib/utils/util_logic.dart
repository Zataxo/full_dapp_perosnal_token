import 'package:flutter/cupertino.dart';
import 'package:personal_token_tracker/utils/enums.dart';

class UtilLogic extends ChangeNotifier {
  bool isPasswordObsecure = false;
  LoadingState state = LoadingState.intial;
  void setLoadingState(LoadingState _state) {
    state = _state;
    notifyListeners();
  }
}
