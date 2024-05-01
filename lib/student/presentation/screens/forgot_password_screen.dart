import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';
import '../constants/text_style.dart';
import '../widgets/common_button.dart';
import '../widgets/text_fields.dart';
import 'otp_screen.dart';
import 'otp_varification.dart';
class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}
class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController phoneController= TextEditingController(text: '+91');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              // padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              padding: const EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 100),

              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 17.4.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password",
                            style: TextStyle( fontWeight: FontWeight.w600, color: ColorsForApp.headingPageColor,fontSize: 18.sp),
                          )
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        children: [
                          Text("Mobile No", style: TextHelper.h7.copyWith(fontWeight: FontWeight.w600),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18,),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number, // Set keyboard type to only allow numbers
                          maxLength: 13, // Restrict the input to 10 characters
                          // prefixIcon: Icon(Icons.person),
                          decoration: InputDecoration(
                            hintText: "Enter your Mobile number",
                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter mobile number";
                            }
                            if (value.length !=10) {
                              return "Mobile number must be 10 digits";
                            }
                            // You can add additional validation logic here
                          },

                        ),


                      ),
                      SizedBox(height: 5.h,),
                    ],
                  ),

                  CommonButton(
                    onpressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseException ex) {
                          },
                          codeSent: (String varificationId, int? resendToken) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreens(verificationId: varificationId),));
                          },
                          codeAutoRetrievalTimeout: (String varificationId) {},
                          phoneNumber: phoneController.text.toString());
                    },
                    buttonText: "Send",
                    // buttonColor: Colors.red,
                  ),
                ],
              ),
            ),
            // SizedBox(height: 1.5.h,),
            SizedBox(
              height: 28.3.h,
              width: 100.w,
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.pink.withOpacity(0.8),
                    image: DecorationImage(
                        image:AssetImage("assets/images/AppLogo.png"),fit: BoxFit.cover )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

