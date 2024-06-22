import 'package:flutter/cupertino.dart';
import 'package:fluttrt_mvvm/repository/auth_repositry.dart';
import 'package:fluttrt_mvvm/utils/routes/routes_names.dart';
import 'package:fluttrt_mvvm/utils/utils.dart';

import '../data/data_class/LogingData.dart';

class AuthViewModel with ChangeNotifier {



  bool _loading=false;
  bool get loading =>_loading;
  void changeLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  final authRepo = AuthRepository();

  Future<void> loginApi(dynamic data,BuildContext context) async {
    changeLoading(true);
    authRepo.loginApi(data).then((value) {
      changeLoading(false);
      final loginData = LogingData.fromJson(value);
      if(loginData.status!){
        Navigator.pushNamed(context, RoutesName.home);
      }else{
        Utils.flushBarMessage(loginData.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      changeLoading(false);
      print(error.toString());
      Utils.flushBarMessage(error.toString(), context);
    });
  }
}
