
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pixpit_demo/models/user.dart';
import 'package:pixpit_demo/screens/LoginResult.dart';
import 'package:pixpit_demo/utils/http.dart';

import '../models/user.dart';
import '../widgets/first.dart';
import '../widgets/inputEmail.dart';
import '../widgets/password.dart';
import '../widgets/textLogin.dart';
import '../widgets/verticalText.dart';

enum LoadingState {
  loading,
  timeout,
  error,
  success,
}

class LoadingScreen extends StatefulWidget {


  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {
  LoadingState _loading = LoadingState.loading;


  void _doneLoading() {
    setState(() {
      _loading = LoadingState.success;
    });
  }

  @override
  Widget build(BuildContext context) {




    return Container(
      child: Center(
        child: FutureBuilder<User>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                // return Text("Contents: ${snapshot.data}");
                return LoginResult(user: snapshot.data);
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Future<User> mockNetworkData() async {

  // ///创建 dio
  Dio dio = new Dio();


  ///请求地址
  ///传参方式1
  // String url = "http://192.168.0.102:8080/getUser/$userId";

  ///在这里修改 contentType
  dio.options.contentType = "application/json";

  ///请求header的配置
  dio.options.headers["appVersionCode"] = 101;
  dio.options.headers["appVersionName"] = "V 1.0.1";

  ///发起get请求
  Response response =
  await dio.get('https://randomuser.me/api/?inc=name,email');
  // print(response.data);
  // Map<List, dynamic> data = jsonDecode(response.data);
  // Map data = jsonDecode(response.data);
  print('\n');
  print('mockNetworkData has run.\n');
  print(response.data['results'][0]);
  User user = new User(response.data['results'][0]['name']['first'],
      response.data['results'][0]['email']);
  print(user);
  return user;
}
