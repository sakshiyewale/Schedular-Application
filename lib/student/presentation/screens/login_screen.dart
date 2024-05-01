import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_application/student/bloc/loginbloc/login_bloc.dart';
import 'package:schedular_application/student/bloc/loginbloc/login_event.dart';
import 'package:schedular_application/student/presentation/screens/home1.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';
import '../constants/text_style.dart';
import '../widgets/common_button.dart';
import '../widgets/text_fields.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RegExp usernameRegex = RegExp(r'^[a-zA-Z]+$');
  final RegExp passwordRegex = RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[A-Z]).{8,}$');

  bool passwordObsecured = true;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
 TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer(
        bloc: LoginBloc(),
       listener: (context, state) {

       },
       builder: (context, state) {
         return  Column(
           children: [
             SizedBox(height: 8.80.h,),
             Padding(
               padding: EdgeInsets.symmetric(vertical:4.80.h, horizontal: 6.w),
               child: Column(
                 children: [
                   Form(
                     key: loginKey,
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(
                               "Log In",
                               style: TextHelper.size20.copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: ColorsForApp.headingPageColor),
                             )
                           ],
                         ),
                         SizedBox(height: 10.h),
                         const Row(
                           children: [
                             Text("Username",
                                 style: TextStyle(fontWeight: FontWeight.w600)),
                           ],
                         ),
                         Padding(
                           padding: EdgeInsets.only(top: 1.h),
                           child: CustomTextField(
                             prefixIcon: Icon(Icons.person),
                             controller: usernameController,
                             // onChange: (val){
                             //   BlocProvider.of<LoginBloc>(context).add(LoginValidationEvent(usernameController.text,passwordController.text));
                             // },
                             hintText: "Type Your Username",
                            // hintTextColor: Colors.red,
                             hintTextColor: Colors.black.withOpacity(0.9),
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return "Please Enter Username";
                               }
                               else if (!usernameRegex.hasMatch(value)) {
                                 return "Username can only contain letters";
                               }

                               return null;
                             },
                             inputFormatters: [],
                           ),
                         ),
                         SizedBox(height: 5.h),
                         Row(
                           children: [
                             Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                           ],
                         ),
                         Padding(
                           padding: EdgeInsets.only(top: 1.h),
                           child: CustomTextField(
                             controller: passwordController,
                             prefixIcon: Icon(Icons.lock_outline_sharp),
                             obscureText: passwordObsecured,
                             hintText: "Type Your Password",
                           //  hintTextColor: Colors.red,
                              hintTextColor: Colors.black.withOpacity(0.9),
                             // onChange: (val){
                             //   BlocProvider.of<LoginBloc>(context).add(LoginValidationEvent(usernameController.text,passwordController.text));
                             // },
                             suffixIcon: GestureDetector(
                                 onTap: (){
                                   setState(() {
                                     passwordObsecured =! passwordObsecured;
                                   });
                                 },
                                 child: passwordObsecured ?Icon(Icons.visibility_off,color: Colors.black,):Icon(Icons.remove_red_eye,color: Colors.black,)),
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return "Please Enter Password";
                               }
                               else if (!passwordRegex.hasMatch(value)) {
                                 return "Password must be at least 8 characters long";
                               }

                               return null;
                             },
                             inputFormatters: [],
                           ),
                         ),
                         SizedBox(height: 1.h),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             GestureDetector(
                               child: Text(
                                 "Forgot password ?",
                                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                               ),
                               onTap: () {
                                 Navigator.pushNamed(context, "forget_screen");
                               },
                             )
                           ],
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 14.sp),
               child: CommonButton(
                 buttonText: "Log In",
                 onpressed: () {
                   if (loginKey.currentState!.validate()) {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                   }
                 },
               ),
             ),
             Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset("assets/images/AppLogo.png", height: 35.95.h, width: 100.w, fit: BoxFit.fill),
                 ],
               ),
             ),
           ],
         );
       },
      ),
    );
  }
}
