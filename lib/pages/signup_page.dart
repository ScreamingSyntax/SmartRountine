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
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // padding: const EdgeInsets.all(20.0),
          constraints: const BoxConstraints.expand(),
          child: Column(
            // verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const HeadingContext(),
              Column(
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textFields(context),
                    _lowerPage(context),
                  ],
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
                obscureText: LoginPage.obscureText,
                decoration: InputDecoration(
                    // isDense: true,
                    fillColor: Theme.of(context).cardColor,
                    prefixIcon: Icon(
                      Icons.password,
                    ),
                    hintText: "Enter Password",
                    helperText: " ",
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        LoginPage.obscureText = !LoginPage.obscureText;
                        setState(() {});
                      },
                    ),
                    // errorText: "Nae Nigga",
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 2),
                    ))),
            TextFormField(
              obscureText: LoginPage.obscureText,
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
              decoration: InputDecoration(
                  // isDense: true,
                  fillColor: Theme.of(context).cardColor,
                  prefixIcon: Icon(
                    Icons.password,
                  ),
                  hintText: "Enter Password",
                  helperText: " ",
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      LoginPage.obscureText = !LoginPage.obscureText;
                      setState(() {});
                    },
                  ),
                  // errorText: "Nae Nigga",
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 2),
                  )),
            ),
          ],
        ),
      );
  Widget _lowerPage(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () => _validation(context),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width /
                      0.001, // 80% of screen width
                  MediaQuery.of(context).size.height *
                      0.07, // // 8% of screen height
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      );
}
