// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes/my_routes.dart';
import '../styles/text_form_field.dart';
import '../validation/my_validations.dart';
import '../widgets/login&signup/login_signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var focusedField = true;
  final _formKey = GlobalKey<FormState>();
  void _validation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          // padding: const EdgeInsets.all(20.0),
          child: Column(
            // verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              HeadingContext(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Login"
                            .text
                            .color(Theme.of(context).colorScheme.onSecondary)
                            .bold
                            .xl5
                            .make(),
                        "Please Sign in to Continue"
                            .text
                            .textStyle(context.captionStyle)
                            .lg
                            .make(),
                        _form(context),
                        _lowerContent(context),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  EmailValidation bc = EmailValidation(
                      value: value,
                      validationType: "Email",
                      minLength: 4,
                      maxLength: 50);
                  String? error = bc.empty();
                  if (error != null) {
                    return error;
                  }
                  error = bc.domainValidation();
                  if (error != null) {
                    return error;
                  }
                  return null;
                },
                decoration: MyTextFormFieldDecoration(
                    hintText: "Enter College Email",
                    iconData: Icons.people_outline_rounded,
                    context: context)),
            TextFormField(
              // onTap: () => setState(() => focusedField = false),
              // onTapOutside: (event) => setState(() => focusedField = false),
              validator: (value) {
                PasswordValidation ac = PasswordValidation(
                  value: value,
                  validationType: "Password",
                  minLength: 7,
                  maxLength: 20,
                );
                String? error = ac.empty();
                if (error != null) {
                  return error;
                }
                error = ac.length();
                if (error != null) {
                  return error;
                }
                error = ac.passwordSecurity();
                if (error != null) {
                  return error;
                }
                return null;
              },
              decoration: MyTextFormFieldDecoration(
                  hintText: "Enter Password",
                  iconData: Icons.password_rounded,
                  context: context),
            ),
          ],
        ),
      );

  Widget _lowerContent(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              "Dont Have An"
                  .text
                  .color(Theme.of(context).colorScheme.onSecondary)
                  .make(),
              " ".text.make(),
              "Account ?"
                  .text
                  .bold
                  .color(Theme.of(context).colorScheme.primary)
                  .make()
                  .onTap(() {
                Navigator.pushNamed(context, MyRoutes.signUpPage);
              })
            ],
          ),
          ElevatedButton(
            onPressed: () => _validation(context),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width *
                      0.4, // 80% of screen width
                  MediaQuery.of(context).size.height *
                      0.05, // 8% of screen height
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Text(
              "LOGIN",
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
}
