import 'package:flutter/material.dart';
import 'package:flutter_application_list/models/user.model.dart';

class UserDetail extends StatelessWidget {
  final User user;
  const UserDetail({ super.key, required this.user });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
      ),
      body: Column(
        children: <Widget> [
          Image.network(user.imageUrl as String,height: 500, fit: BoxFit.cover),
          Text(user.loginName as String,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }

}