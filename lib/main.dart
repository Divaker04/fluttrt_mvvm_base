import 'package:flutter/material.dart';
import 'package:fluttrt_mvvm/utils/routes/routes.dart';
import 'package:fluttrt_mvvm/utils/routes/routes_names.dart';
import 'package:fluttrt_mvvm/view/login_screen.dart';
import 'package:fluttrt_mvvm/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModel())
    ],
    child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
     
  }
}

