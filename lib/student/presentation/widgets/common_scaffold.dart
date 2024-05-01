import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonScaffoldOne extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget appbar;

  CommonScaffoldOne({
    Key? key,
    this.body,
    required this.appbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'), // Add your app title here
      ),
      resizeToAvoidBottomInset: false,
      body: body ??
          Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/AppLogo.png",
                      height: 34.95.h,
                      width: 100.w,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
