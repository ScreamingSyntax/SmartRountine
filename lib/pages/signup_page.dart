import 'package:flutter/material.dart';
import 'package:routine_app/widgets/login&signup/login_signup.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes/my_routes.dart';
import '../styles/text_form_field.dart';
import '../validation/my_validations.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String password1 = "";

  String password2 = "";

  final _formKey = GlobalKey<FormState>();
  void _validation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          // padding: const EdgeInsets.all(20.0),
          constraints: const BoxConstraints.expand(),
          child: Column(
            // verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const HeadingContext(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Sign Up"
                            .text
                            .color(Theme.of(context).colorScheme.onSecondary)
                            .bold
                            .xl5
                            .make(),
                        "Please Enter Valid Credentials"
                            .text
                            .textStyle(context.captionStyle)
                            .lg
                            .make(),
                        _textFields(context),
                        _lowerPage(context),
                      ],
                    ),
                  ),
                ),
              ),
              const BottomContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFields(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                NameValidation ac = NameValidation(
                    value: value,
                    validationType: "Name",
                    minLength: 4,
                    maxLength: 10);
                String? error = ac.empty();
                if (error != null) {
                  return error;
                }
                error = ac.specialCharacters();
                if (error != null) {
                  return error;
                }
                error = ac.fullNameValidation();
                if (error != null) {
                  return error;
                }
                return null;
              },
              decoration: MyTextFormFieldDecoration(
                  hintText: "Enter Full Name",
                  iconData: Icons.person_2,
                  context: context),
            ),
            TextFormField(
              validator: (value) {
                EmailValidation ac = EmailValidation(
                    value: value,
                    validationType: "Email",
                    minLength: 4,
                    maxLength: 50);
                String? error = ac.empty();
                if (error != null) {
                  return error;
                }
                error = ac.domainValidation();
                if (error != null) {
                  return error;
                }
                return null;
              },
              decoration: MyTextFormFieldDecoration(
                  hintText: "Enter Email Address",
                  iconData: Icons.mail,
                  context: context),
            ),
            TextFormField(
              onChanged: (value) {
                password1 = value;
                setState(() {});
              },
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
                if (password2 != value) {
                  return "${ac.validationType} do not match";
                }
                return null;
              },
              decoration: MyTextFormFieldDecoration(
                  hintText: "Enter Password",
                  iconData: Icons.password_outlined,
                  context: context),
            ),
            TextFormField(
              onChanged: (value) {
                password2 = value;
                setState(() {});
              },
              validator: (value) {
                PasswordValidation ac = PasswordValidation(
                    value: value,
                    validationType: "Password",
                    minLength: 7,
                    maxLength: 20);
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
                if (password1.toString() != value) {
                  return "${ac.validationType} Field do not match";
                }
                return null;
              },
              decoration: MyTextFormFieldDecoration(
                  hintText: "Re-Enter Password",
                  iconData: Icons.password_outlined,
                  context: context),
            ),
          ],
        ),
      );
  Widget _lowerPage(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              "Already Have an "
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
                Navigator.pushNamed(context, MyRoutes.loginPage);
              })
            ],
          ),
          ElevatedButton(
            onPressed: () => _validation(context),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width *
                      0.3, // 80% of screen width
                  MediaQuery.of(context).size.height *
                      0.04, // 8% of screen height
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
}
