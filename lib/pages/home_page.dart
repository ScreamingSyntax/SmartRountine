import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1, crossAxisSpacing: 1),
            children: const [
              GridTileBar(
                leading: GridTileBar(
                  backgroundColor: Colors.black45,
                  leading: Text("Get"),
                  title: Text("This is title"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
