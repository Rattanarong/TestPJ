import 'package:flutter/material.dart';
import 'package:test1/State/mainpage.dart';
import 'package:test1/State/register.dart';
import 'package:test1/utility/my_constant.dart';
import 'package:test1/widgets/show_image.dart';
import 'package:test1/widgets/show_title.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            children: [
              buildImage(size),
              buildAppName(),
              buildUser(size),
              buildPassword(size),
              buildLogin(size),
              buildCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Non Account ?',
          textStyle: Myconstat().h9Style(),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Register())),
          child: Text(
            'create Account',
            style: Myconstat().h8Style(),
          ),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
            style: Myconstat().MyButtonStyle(),
            onPressed: () {
              login();
            },
            child: Text('Login'),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.65,
          child: TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelStyle: Myconstat().h3Style(),
              labelText: 'User :',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Myconstat.light2,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.dark1),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.light1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.65,
          child: TextFormField(
            controller: passwordController,
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: Myconstat.dark2,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: Myconstat.dark2,
                      ),
              ),
              labelStyle: Myconstat().h3Style(),
              labelText: 'password :',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Myconstat.light2,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.dark1),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.light1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(title: Myconstat.appName, textStyle: Myconstat().h1Style()),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(path: Myconstat.image1),
        ),
      ],
    );
  }

  Future login() async {
    var url = Uri.http('192.168.1.146:8000', '/api/login/');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"username":"${usernameController.text}","password":"${passwordController.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('----------');
    print(response.body);
    if (response.body == "") {
      passwordController.clear();
    }
    if (response.body == "") {
      final snackBar = SnackBar(
        backgroundColor: Myconstat.broun,
        content: const Text('เข้าสู่ระบบสำเร็จ'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // passwordController.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Mainpage();
      }));
    }
  }
}
