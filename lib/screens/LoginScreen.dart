
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pixpit_demo/models/user.dart';
import 'package:pixpit_demo/screens/LoginResult.dart';

import '../models/user.dart';
import '../widgets/first.dart';
import '../widgets/inputEmail.dart';
import '../widgets/password.dart';
import '../widgets/textLogin.dart';
import '../widgets/verticalText.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user;

    BaseOptions options = BaseOptions(
      baseUrl: "https://randomuser.me/api/", // get random user
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    ///请求header的配置
    options.headers['appVersionCode'] = 101;
    options.headers['appVersionName'] = "V 1.0.1";
    options.headers['token'] = '';

    options.contentType = "application/json";
    options.method = "GET";
    options.connectTimeout = 8000;
    options.receiveTimeout = 5000;

    ///创建 dio
    // Dio dio = new Dio(options);

    void getUser() async {
      // ///用户id
      // int userId = 3;

      // ///创建 dio
      Dio dio = new Dio(options);

      // ///请求地址
      // ///传参方式1
      // String url = "http://192.168.0.102:8080/getUser/$userId";

      // ///在这里修改 contentType
      // dio.options.contentType = "application/json";

      // ///请求header的配置
      // dio.options.headers["appVersionCode"] = 101;
      // dio.options.headers["appVersionName"] = "V 1.0.1";

      ///发起get请求
      Response response =
          await dio.get('https://randomuser.me/api/?inc=name,email');
      // print(response.data);
      // Map<List, dynamic> data = jsonDecode(response.data);
      // Map data = jsonDecode(response.data);
      print('\n');
      print('\n');
      print('\n');
      print(response.data['results'][0]);
      user = new User(response.data['results'][0]['name']['first'],
          response.data['results'][0]['email']);
      print(user);

      // 跳转至登陆结果页
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new LoginResult(user: user),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlue, Colors.lightBlue]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[300],
                          blurRadius:
                              10.0, // has the effect of softening the shadow
                          spreadRadius:
                              1.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      onPressed: getUser,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
