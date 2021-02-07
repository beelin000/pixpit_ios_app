import 'package:flutter/material.dart';
import 'package:pixpit_demo/models/user.dart';

class LoginResult extends StatelessWidget {
  final User user;

  // In the constructor, require a Todo
  LoginResult({Key key, @required this.user}) : super(key: key);

  // const LoginResult({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // User user;
    return FutureBuilder<User>(
      builder: (context, snapshot) {
        if (user != null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              toolbarOpacity: 1,
              title: Text('Login Success'),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.lightBlue, Colors.lightBlue] //Colors.lightBlueAccent]
                ),
              ),
              child:Center(
                child: Text(
                  'Welcome, ${user.name}!',
                  style: TextStyle(fontSize: 28.0, color: Colors.white),
                ),
              )
            ),
          );
          // return new Text('Welcome!');
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        // By default, show a loading spinner
        return Container(child: Center(widthFactor: 1, heightFactor: 0.8, child: CircularProgressIndicator(),),);
      },
    );
  }
}
