import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:fp_tpm/components/my_button.dart';
import 'package:fp_tpm/components/my_textfield.dart';
import 'package:fp_tpm/pages/login_page.dart';
import 'package:fp_tpm/utils/validation.dart';
import 'package:fp_tpm/utils/encryption.dart';

class SignUp extends StatelessWidget{
  SignUp({super.key});

  String username = "";
  String password = "";
  String confirmPassword = "";
  bool isRegisterSuccess = false;
  
  final box = GetStorage();
  final favorite = GetStorage('favorite');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                //username
                const SizedBox(height: 25),
                MyTextfield(
                  hintText: 'Username', 
                  obscureText: false, 
                  onChanged: (value) => {
                    username = value,
                    print('Username : $username'),
                  }
                ),

                //password
                const SizedBox(height: 10),
                MyTextfield(
                  hintText: 'Password', 
                  obscureText: true, 
                  onChanged: (value) => {
                    password = value,
                    print('Password : $password'),
                  }
                ),

                //re-enter password
                const SizedBox(height: 10),
                MyTextfield(
                  hintText: 'Re-enter password', 
                  obscureText: true, 
                  onChanged: (value) => {
                    confirmPassword = value,
                    print('Confirm Password : $confirmPassword'),
                  }
                ),

                const SizedBox(height: 25),
                MyRealButton(
                  text: "Sign Up", 
                  width: MediaQuery.of(context).size.width*.9, 
                  height: 60,
                  color: Colors.blueGrey,
                  onTap: (){
                    String text = '';
                    if(!isValidated(username, "username")){
                      text = "Username should be 4-20 character long!";
                      isRegisterSuccess = false;
                    } 
                    else if(!isValidated(password, "password")){
                      text = "Password should be at least 5 character consisted of uppercase, lowercase, number, and symbol. ";
                      isRegisterSuccess = false;
                    } 
                    else if(isPasswordConfirmed(password, confirmPassword)){
                      if(!box.hasData(username.toLowerCase())){
                        String hashedPassword = hashPassword(password);
                        box.write(username.toLowerCase(),[hashedPassword, username]);
                        favorite.write(username.toLowerCase(), []);
                        text = "Signup Success!";
                        isRegisterSuccess = true;
                      }
                      else{
                        text = " Username is already taken!";
                        isRegisterSuccess = false;
                      }
                    }
                    else{
                      text = "Pleas re-enter the same password";
                      isRegisterSuccess = false;
                    }
                    SnackBar snackbar = SnackBar(
                      content: Text(text,),
                      backgroundColor: isRegisterSuccess? const Color.fromARGB(255, 59, 210, 64) : const Color.fromARGB(255, 177, 17, 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                        //borderRadius: BorderRadius.circular(10)
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    if(isRegisterSuccess){
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context){
                            return LoginPage();
                          }
                        ),
                      );
                    }
                  }, 
                ),

                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: .5,
                        color: Colors.grey[400],
                      ), 
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Signup With',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ), 
                    ),
                    Expanded(
                      child: Divider(
                        thickness: .5,
                        color: Colors.grey[400],
                      ),
                    ),
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
