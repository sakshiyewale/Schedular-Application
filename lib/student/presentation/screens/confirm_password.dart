import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedular_application/student/presentation/widgets/constant_widgets.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';
import '../constants/text_style.dart';
import '../widgets/common_button.dart';
import '../widgets/text_fields.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordObsecured = true;
  bool confirmPasswordObsecured = true;
  String ? passwordError;
  String ? confirmPasswordError;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 15.h,),
          Padding(
            padding: EdgeInsets.symmetric(vertical:4.45.h, horizontal: 6.w),            child: Column(
            children: [
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Confirm Password",
                          style: TextHelper.size20.copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: ColorsForApp.headingPageColor),
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text("Password",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize:18)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: CustomTextField(
                        controller: passwordController,
                        prefixIcon: Icon(Icons.person),
                        obscureText:passwordObsecured,
                        hintText: "Type Your  Password",
                        errorText: passwordError,
                        hintTextColor: Colors.black.withOpacity(0.6),
                        onChange:  (value) {
                          setState(() {
                            passwordError = !isValidPassword(value)
                                ? 'Password must contain atleast.\n 1) 8 characters long.\n 2) 1 special character.\n 3) 1 digit. \n 4) 1 capital character.'
                                : null;
                          });
                        },
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                passwordObsecured =! passwordObsecured;
                              });
                            },
                            child: passwordObsecured ?Icon(Icons.visibility_off,color: Colors.black,):Icon(Icons.remove_red_eye,color: Colors.black,)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                          return null;
                        },
                        inputFormatters: [],
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      children: [
                        Text("Confirm Password",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize:18)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: CustomTextField(
                        controller: confirmPasswordController,
                        prefixIcon: Icon(Icons.person),
                        hintText: "Type Your Confirm Password",
                        errorText: confirmPasswordError,
                        obscureText: confirmPasswordObsecured,
                        hintTextColor: Colors.black.withOpacity(0.6),
                        // onChange:  (value) {
                        //   setState(() {
                        //     confirmPasswordError = !isValidPassword(value)
                        //         ? 'Password must contain atleast,\n 1) 8 characters long,\n 2) 1 special character,\n 3) 1 digit. \n 4) 1 capital character'
                        //         : null;
                        //   });
                        // },
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                confirmPasswordObsecured =! confirmPasswordObsecured;
                              });
                            },
                            child: confirmPasswordObsecured ?Icon(Icons.visibility_off,color: Colors.black,):Icon(Icons.remove_red_eye,color: Colors.black,)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                          return null;
                        },
                        inputFormatters: [],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
          SizedBox(height: 4.85.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp),
            child: CommonButton(
              buttonText: "Submit",
              onpressed: () {
                if (isValidPassword(passwordController.text)==true) {
                  if(passwordController.text ==confirmPasswordController.text ){
                    Navigator.pushNamed(context, "login_screen");
                  }
                  else
                    {
                        return;
                    }
                }
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/AppLogo.png", height: 35.95.h, width: 100.w, fit: BoxFit.fill),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isValidPassword(String password) {
    RegExp passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$');
    if (!passwordRegex.hasMatch(passwordController.text) ||
        !passwordController.text.isNotEmpty ) {
      return false;
    } else {
      return true;
    }
    // Your password validation logic, return true if valid, false otherwise
  }
}
