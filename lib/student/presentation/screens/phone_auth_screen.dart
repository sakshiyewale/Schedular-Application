// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'otp_screen.dart';
// import 'otp_varification.dart';
//
// class PhoneAuth extends StatefulWidget {
//   const PhoneAuth({super.key});
//
//   @override
//   State<PhoneAuth> createState() => _PhoneAuthState();
// }
//
// class _PhoneAuthState extends State<PhoneAuth> {
//   TextEditingController mobileController = TextEditingController();
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
//         padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: mobileController,
//               decoration: InputDecoration(
//                 hintText: "+91 Enter Your Mobile Number",
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
//               height: 50,
//             ),
//             GestureDetector(
//               onTap: () async {
//                 await FirebaseAuth.instance.verifyPhoneNumber(
//                     verificationCompleted: (PhoneAuthCredential credential) {},
//                     verificationFailed: (FirebaseException ex) {
//                     },
//                     codeSent: (String varificationId, int? resendToken) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => OTPScreens(verificationId: 'varificationId',),
//                           ));
//                     },
//                     codeAutoRetrievalTimeout: (String varificationId) {},
//                     phoneNumber: mobileController.text.toString());
//               },
//               child: Container(
//                 height: 50,
//                 width: 250,
//                 decoration: BoxDecoration(
//                     color: Colors.pink,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Center(
//                     child: Text(
//                       "Varified Your Phone Number",
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