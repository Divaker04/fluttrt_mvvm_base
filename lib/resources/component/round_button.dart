import 'package:flutter/material.dart';

import '../colors.dart';
class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({super.key,required this.title,this.loading=false,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: InkWell(onTap: onPress,
        child: Container(
         decoration: BoxDecoration(color: AppColors.buttonColor,borderRadius: BorderRadius.circular(15)),
          height: 40,
          width: double.infinity,
          child: Center(child:loading?CircularProgressIndicator(color: Colors.white,): Text(title,style: TextStyle(color: AppColors.white,fontSize: 20),)),
        ),
      ),
    );
  }
}
