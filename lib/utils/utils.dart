import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  // static toastMessage(String message){
  //    Fluttertoast.showToast(msg: message);
  //  }


  static fieldFocusChange(BuildContext context,FocusNode current,FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static flushBarMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          message: message,
          duration: Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Colors.red,
          positionOffset: 20,
          icon: Icon(Icons.error,color: Colors.white,),
        )..show(context));
  }

  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),backgroundColor: Colors.blue,));
  }

}
