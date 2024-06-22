import 'package:flutter/material.dart';
import 'package:fluttrt_mvvm/resources/component/round_button.dart';
import 'package:fluttrt_mvvm/utils/utils.dart';
import 'package:fluttrt_mvvm/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController userName = TextEditingController();
TextEditingController userPassword = TextEditingController();
FocusNode mobile = FocusNode();
FocusNode password = FocusNode();
ValueNotifier<bool> _obsecure = ValueNotifier<bool>(true);

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userName.dispose();
    userPassword.dispose();
    mobile.dispose();
    password.dispose();
    _obsecure.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("WELCOME", style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: userName,
              focusNode: mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Mobile"),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, mobile, password);
              },
            ),
            const SizedBox(
              height: 25,
            ),
            ValueListenableBuilder(
                valueListenable: _obsecure,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: userPassword,
                    obscureText: _obsecure.value,
                    focusNode: password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Password",
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecure.value = !_obsecure.value;
                            },
                            child: _obsecure.value
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined))),
                  );
                }),
            RoundButton(title: "Login",loading: authViewModel.loading, onPress: (){
              if(userName.text.isEmpty){
                Utils.flushBarMessage("Please enter mobile", context);
              }else if(userPassword.text.isEmpty){
                Utils.flushBarMessage("Please enter password", context);

              }else if(userPassword.text.length<2){
                Utils.flushBarMessage("Please enter 3 digit", context);

              }
              else{
                Map<String, dynamic> data = {
                  'LoginID': userName.text.toString(),//9999999999
                  'Password': userPassword.text.toString(),//123
                  'DeviceID': "deviceId",
                  'FirebaseToken': "aaaaaaaaaaasddgfhkjlk;lk",
                };
                authViewModel.loginApi(data,context);
                print("hit api");
              }

            })
          ],
        ),
      ),
    );
  }
}
