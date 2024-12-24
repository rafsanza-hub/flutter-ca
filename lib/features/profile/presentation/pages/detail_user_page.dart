import 'package:flutter/material.dart';

class DetailUserPage extends StatelessWidget {
  const DetailUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
