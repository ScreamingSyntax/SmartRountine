import 'package:flutter/material.dart';
import 'package:routine_app/validation/my_validations.dart';

import '../../styles/textFormFields.dart';

class SignUpField extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const SignUpField({super.key, required this.formKey});

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  String password1 = "";
  String password2 = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
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
            },
            decoration: MyTextFormFieldDecoration(
              enabledColor: Theme.of(context).colorScheme.onSurface,
              focusedColor: Theme.of(context).colorScheme.onSurface,
              hintText: "Enter Full Name",
              iconData: Icons.person_2,
            ),
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
            },
            decoration: MyTextFormFieldDecoration(
              enabledColor: Theme.of(context).colorScheme.onSurface,
              focusedColor: Theme.of(context).colorScheme.onSurface,
              hintText: "Enter Email Address",
              iconData: Icons.mail,
            ),
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
            },
            decoration: MyTextFormFieldDecoration(
              enabledColor: Theme.of(context).colorScheme.onSurface,
              focusedColor: Theme.of(context).colorScheme.onSurface,
              hintText: "Enter Password",
              iconData: Icons.password_outlined,
            ),
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
            },
            decoration: MyTextFormFieldDecoration(
              enabledColor: Theme.of(context).colorScheme.onSurface,
              focusedColor: Theme.of(context).colorScheme.onSurface,
              hintText: "Re-Enter Password",
              iconData: Icons.password_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
