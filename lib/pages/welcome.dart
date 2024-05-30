import 'package:flutter/material.dart';
import 'package:fp_tpm/pages/login_page.dart';
import 'package:fp_tpm/pages/widgets/image_holder.dart';
import 'package:fp_tpm/components/my_button.dart';

class WelcomePage extends StatelessWidget{
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Easy Banking',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              /* ImageHolder(
                imagePath: "imagePath", 
                height: 80,
              ), */
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome to Easy Bank!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Your journey to effortless banking starts here',
                style: TextStyle(
                  color: const Color.fromARGB(255, 109, 109, 109),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              MyRealButton(
                text: 'Get Started!', 
                onTap: (){
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context){
                        return LoginPage();
                      }
                    ),
                  );
                }, 
                width: MediaQuery.of(context).size.width*.9, 
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}