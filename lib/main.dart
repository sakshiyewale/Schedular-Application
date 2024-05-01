import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_application/student/bloc/confirmpasswordbloc/confirmpassword_bloc.dart';
import 'package:schedular_application/student/bloc/forgetbloc/forget_bloc.dart';
import 'package:schedular_application/student/bloc/homebloc/home_bloc.dart';
import 'package:schedular_application/student/bloc/loginbloc/login_bloc.dart';
import 'package:schedular_application/student/bloc/otpbloc/otp_bloc.dart';
import 'package:schedular_application/student/presentation/screens/login_screen.dart';
import 'package:schedular_application/student/presentation/screens/phone_auth_screen.dart';
import 'package:schedular_application/student/routes/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
   );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
            ),
            BlocProvider<ForgetBloc>(
              create: (context)=>ForgetBloc(),
            ),
            BlocProvider<HomeDataBloc>(
              create: (context)=>HomeDataBloc(),
            ),
            BlocProvider<OtpBloc>(
              create: (context)=>OtpBloc(),
            ),
            BlocProvider<ConfirmPasswordBloc>(
              create: (context)=>ConfirmPasswordBloc(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scheduler Application',
            onGenerateRoute: Routes.generateRoute,
            initialRoute: 'login_screen',
            // home: LoginScreen(),
          ),
        );
      },
    );
  }
}