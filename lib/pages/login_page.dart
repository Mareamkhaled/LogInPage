import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../helper/show_snakbar.dart';
import '../core/asset_manager.dart';
import '../core/color_manager.dart';
import '../core/text_manager.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/signin_button.dart';
import '../widgets/signup_txt.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email , password;
GlobalKey <FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(AssetManager.image)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              TextManager.Welcome,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              TextManager.txtone,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            const Text(
              TextManager.txttwo,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hint: "Example@email.com",
              name: "Email",
              onchanged: (data) {
                email =data;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: "enter ur password",
              name: "Password",
              onchanged: (data) {
                password =data;
              },
            ),
            const SizedBox(
              height: 15,
            ),
           const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forget Password?",
                style: TextStyle(color: ColorManager.blue),)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SigninButton(ontap: ()async {
      
                 if (formkey.currentState!.validate()) {
                  
                  setState(() {
                    
                  });
          try {
         // ignore: unused_local_variable
         // var auth = FirebaseAuth.instance;
         await logInUser(); 
         // ignore: use_build_context_synchronously
          showSnakBar(context, "Success");
          } 
          
          on FirebaseAuthException catch (ex) {
                 if (ex.code == 'user not found') {
                 // ignore: avoid_print, use_build_context_synchronously
                 showSnakBar(context,"user not found");
           } else if (ex.code == 'Weak Password') {
        // ignore: use_build_context_synchronously
           showSnakBar(context, "Weak Password.");
        //print('The account already exists for that email.');
         }
              }
              catch(ex){
                // ignore: avoid_print, use_build_context_synchronously
                showSnakBar(context, "there is an error");
              }
              
              setState(() {
                
              });
           
        }else{}
              },),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't you have an account?  ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SignupTxt()
              ],
            )
          ],
        ),
      ),
    );
  }


  Future<void> logInUser() async {
    // ignore: unused_local_variable
    UserCredential user =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!); 
  }
}
