import 'package:flutter/material.dart';
import 'package:routine_app/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../routes/my_routes.dart';

class LowerContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LowerContent({super.key, required this.formKey});

  void _validation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
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
            "Sign Up",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                letterSpacing: 3),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Already Have an ".text.make(),
            " ".text.make(),
            "Account ?".text.bold.color(Colors.blue).make().onTap(() {
              Navigator.pushNamed(context, MyRoutes.loginPage);
            })
          ],
        ),
      ],
    );
  }
}
