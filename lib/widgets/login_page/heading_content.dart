import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginHeadingContext extends StatelessWidget {
  const LoginHeadingContext({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Welcome Back"
            .text
            .ellipsis
            .uppercase
            .bold
            .textStyle(context.headlineLarge)
            .make(),
        "Please Login Using Valid Credentials"
            .text
            .bold
            .textStyle(context.captionStyle)
            .make(),
      ],
    );
  }
}
