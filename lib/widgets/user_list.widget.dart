import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_list/models/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_list/widgets/user_detail.widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  final List<User> _users = [];

  Future _getUsers() async {
    var response = await http.get(Uri.parse("https://api.github.com/users"),
      headers: { "Application" : "application/json" }
    );

    setState(() {
      var list = json.decode(response.body);
      for(var item in list) {
        _users.add(User(item["login"],item["type"],item["avatar_url"]));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_users[index].loginName as String),
            subtitle: Text(_users[index].userType as String),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(_users[index].imageUrl as String)
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserDetail(user: _users[index])
              ));
            },
          );
        },
      ),
    );
  }

}
