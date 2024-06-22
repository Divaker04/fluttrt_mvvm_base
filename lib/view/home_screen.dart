import 'package:flutter/material.dart';
import 'package:fluttrt_mvvm/resources/colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home"),backgroundColor: AppColors.appBar,),);
  }
}
