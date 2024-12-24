import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllUserPage extends StatelessWidget {
  const AllUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text("User ke-$index"),
              onTap: () => context.pushNamed('detail_user'));
        },
      ),
    );
  }
}
