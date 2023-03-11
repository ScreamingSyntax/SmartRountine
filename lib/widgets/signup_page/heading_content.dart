import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpHeading extends StatelessWidget {
  const SignUpHeading({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Sign Up"
            .text
            .ellipsis
            .uppercase
            .bold
            .textStyle(context.headlineLarge)
            .make(),
        "Please Enter Valid Credentials"
            .text
            .bold
            .textStyle(context.captionStyle)
            .make(),
      ],
    );
  }
}
