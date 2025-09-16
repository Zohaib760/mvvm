import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mvvm/res/Components/round_button.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view/sign_up_view.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/general_utils.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

   ValueNotifier <bool>_obsecurePassword = ValueNotifier<bool>(true);
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   FocusNode emailFocusNode =FocusNode();
   FocusNode passwordFocusNode = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

   @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(

        title: Text("Log In  "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: emailFocusNode,
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                hintText: "Email"
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
         const    SizedBox(height: 20,),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    focusNode:  passwordFocusNode,
                    controller: passwordController,
                    obscureText: value,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(onPressed: (){
                        _obsecurePassword.value = !_obsecurePassword.value;
                        },
                            icon: Icon(
                                _obsecurePassword.value?Icons.visibility_off:Icons.visibility
                            )),
                        prefixIcon: Icon(Icons.password_outlined),
                        hintText: "Password"
                    ), 
                  );
                }
            ),
            SizedBox(height: height*.085,),
            RoundButton(title: "LOG IN", loading: authViewModel.loading, onPress: (){

              if(emailController.text.isEmpty){
              return Utils.flasBarErrorMessage("Enter Email", context);
            }else if(passwordController.text.isEmpty){
                return Utils.flasBarErrorMessage("Enter Password", context);
              }else if(passwordController.text.length<8){
                return Utils.flasBarErrorMessage("Passwrod must be 8 characters", context);
              }
              else{
                Map data = {
                  "email": emailController.text.toString(),
                  "password": passwordController.text.toString()
                };
                authViewModel.logInApi(data, context);
              }
              }),
            SizedBox(height: height*0.02,),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context , RoutesNames.signUp);
                },
                child: Text("Dont have account ? Sign UP")),
          ]
        ),
      ),
    );
  }
}
