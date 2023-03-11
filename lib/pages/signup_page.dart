import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes/my_routes.dart';
import '../styles/textFormFields.dart';
import '../widgets/signup_page/heading_content.dart';
import '../widgets/signup_page/lower_content.dart';
import '../widgets/signup_page/signup_field.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: Column(
              // verticalDirection: VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const SignUpHeading(),
                SignUpField(formKey: _formKey),
                LowerContent(
                  formKey: _formKey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
