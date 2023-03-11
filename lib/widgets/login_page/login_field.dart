import 'package:flutter/material.dart';
import 'package:routine_app/validation/my_validations.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../styles/textFormFields.dart';

class LoginField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginField({super.key, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
              },
              decoration: MyTextFormFieldDecoration(
                hintText: "Enter College Email",
                iconData: Icons.people_outline_rounded,
                enabledColor: Theme.of(context).colorScheme.onSurface,
                focusedColor: Theme.of(context).colorScheme.onSurface,
              )),
          TextFormField(
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
            },
            decoration: MyTextFormFieldDecoration(
              hintText: "Enter Password",
              iconData: Icons.password_rounded,
              enabledColor: Theme.of(context).colorScheme.onSurface,
              focusedColor: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
