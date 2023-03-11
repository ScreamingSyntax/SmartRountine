import 'package:flutter/material.dart';
import 'package:routine_app/routes/my_routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../pages/login_page.dart';

class LoginLowerContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginLowerContent({super.key, required this.formKey});

  void _validation(BuildContext context) {
    if (formKey.currentState!.validate()) {
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
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _validation(context),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(
                MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                MediaQuery.of(context).size.height *
                    0.08, // 8% of screen height
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Dont Have An".text.make(),
            " ".text.make(),
            "Account ?".text.bold.color(Colors.blue).make().onTap(() {
              Navigator.pushNamed(context, MyRoutes.signUpPage);
            })
          ],
        ),
      ],
    );
  }
}
