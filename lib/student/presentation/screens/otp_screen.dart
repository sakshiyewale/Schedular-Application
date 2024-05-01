// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'home_screen.dart';
//
// // ignore: must_be_immutable
// class OTPScreen extends StatefulWidget {
//   String VarificationId;
//   OTPScreen({super.key, required this.VarificationId});
//
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   TextEditingController OtpController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Center(
//                 child: Text(
//                   "Phone Auth",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Colors.black),
//                 ))
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: OtpController,
//               decoration: InputDecoration(
//                 hintText: "Enter OTP",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             GestureDetector(
//               onTap: () async {
//                 try {
//                   PhoneAuthCredential credential =
//                   await PhoneAuthProvider.credential(
//                       verificationId: widget.VarificationId,
//                       smsCode: OtpController.text.toString());
//                   FirebaseAuth.instance.signInWithCredential(credential).then((value){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
//                   });
//                 } catch (ex) {
//                   log(ex.toString());
//                 }
//               },
//               child: Container(
//                 height: 30,
//                 width: 90,
//                 decoration: BoxDecoration(
//                     color: Colors.pink,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Center(
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700),
//                     )),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }