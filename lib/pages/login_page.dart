import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fp_tpm/components/my_textfield.dart';
import 'package:fp_tpm/components/my_button.dart';
import 'package:fp_tpm/pages/home_page.dart';
import 'package:fp_tpm/pages/signup_page.dart';
import 'package:fp_tpm/utils/encryption.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget{
  LoginPage({super.key});
  String username = '';
  String password = '';
  bool isLoginSuccess = false;

  final box = GetStorage();
  final checkLogin = GetStorage('checkLogin');

  void updateLoginState(bool isSuccess, String message){
    if(isSuccess){
      checkLogin.write('isLoggedIn', true);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                
                //logo
                const Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Colors.blueGrey,
                ),

                const SizedBox(height: 25),
                //username
                MyTextfield(
                  hintText: 'Username', 
                  obscureText: false, 
                  onChanged: (value) => {
                    username = value,
                  }
                ),

                const SizedBox(height: 10),
                //password
                MyTextfield(
                  hintText: 'Password', 
                  obscureText: true, 
                  onChanged: (value) => {
                    password = value,
                  }
                ),

                const SizedBox(height: 25),
                //button
                MyRealButton(
                  text: 'Login', 
                  width: MediaQuery.of(context).size.width*0.9, 
                  height: 60,
                  color: const Color.fromARGB(255, 51, 89, 108),
                  onTap: (){
                    String text = "";
                    String realUsername = "";

                    if(box.hasData(username.toLowerCase()) && box.read(username.toLowerCase())[0] == hashPassword(password)){
                      isLoginSuccess = true;
                      text = " Login Success!!!";
                      realUsername = box.read(username)[1];
                    }
                    else{
                      isLoginSuccess = false;
                      text = 'Wrong username/password!';
                    }
                    if(isLoginSuccess){
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context){
                            checkLogin.write('isLoggedIn', true);
                            checkLogin.write('isLoggedIn', realUsername);
                            return const MainHomePage();
                          }
                        ),
                      );
                    }
                  }, 
                ),

                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness:  .5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Continue With',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness:  .5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have any account? try ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:(context){
                            return SignUp();
                          }
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}