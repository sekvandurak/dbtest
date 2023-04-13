import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:term_project0/pages/login.dart';
import '../api_connection/api_connection.dart';
import '../model/user.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late String email, password, name;
  final formkey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: appBody(height),
    );
  }

  SingleChildScrollView appBody(double height) {
    return SingleChildScrollView(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customSizedBox2(),
              titleText(),
              customSizedBox(),
              textTemp('Login'),
              textTemp('Please sign in to continue'),
              customSizedBox(),
              nameTextField(),
              customSizedBox(),
              emailTextField(),
              customSizedBox(),
              passwordTextField(),
              customSizedBox(),
              forgotPasswordButton(),
              customSizedBox(),
              signInButton(),
              loginButton(),
              customSizedBox(),
            ],
          ),
        ),
      )),
    );
  }

  Text titleText() {
    return Text(
      "PERSONA",
      style: TextStyle(fontSize: 45, color: Color(0xff31274F)),
    );
  }

  Text textTemp(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 13, color: Colors.white60),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      style: TextStyle(color: Colors.white60),
      decoration: customInputDecoration("E-Mail", iconForMail()),
    );
  }

  TextFormField nameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        } else {}
      },
      onSaved: (value) {
        name = value!;
      },
      style: TextStyle(color: Colors.white60),
      decoration: customInputDecoration("Name", iconForName()),
    );
  }

  Obx passwordTextField() {
    return Obx(
      () => TextFormField(
        controller: passwordController,
        obscureText: isObsecure.value,
        validator: (value) {
          if (value!.isEmpty) {
            return "Bilgileri Eksiksiz Doldurunuz";
          } else {}
        },
        onSaved: (value) {
          password = value!;
        },
        style: TextStyle(color: Colors.white60),
        decoration: customInputDecoration("Password", iconForPassword()),
      ),
    );
  }

  Widget forgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Container(
            height: 20,
            width: 120,
            //margin: EdgeInsets.symmetric(horizontal: 20),
            /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff31274F)),*/
            child: Center(
              child: customText(
                "Forgot Password",
                Colors.white60,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            validateUserEmail();
          }
        },
        child: Container(
          height: 50,
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xff31274F)),
          child: Center(
            child: customText("Sign up ", Colors.white60),
          ),
        ),
      ),
    );
  }

  Center loginButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dont have an account? Please',
              style: TextStyle(color: Colors.white)),
          TextButton(
            onPressed: () => Get.to(LoginPage()),
            child: customText(
              "Login!",
              Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
        height: 20,
      );
  Widget customSizedBox2() => SizedBox(
        height: 250,
      );

  Widget customText(String text, Color color) => Text(
        text,
        style: TextStyle(color: color),
      );
  Widget iconForMail() => Icon(Icons.mail, color: Colors.white);
  Widget iconForPassword() => Icon(Icons.lock, color: Colors.white);
  Widget iconForName() => Icon(Icons.person, color: Colors.white);
  InputDecoration customInputDecoration(String hintText, Widget iconFor) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: iconFor,
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }

  validateUserEmail() async {
    try {
      var res = await http.post(Uri.parse(API.validateEmail), body: {
        "user_email": emailController.text.trim(),
      });
      if (res.statusCode == 200) {
        var resBodyValidateEmail = jsonDecode(res.body);
        if (resBodyValidateEmail['emailFound'] == true) {
          Fluttertoast.showToast(msg: 'Email already exists');
        } else {
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSaveUserRecord() async {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );
      if (res.statusCode == 200) {
        var resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp['success'] == true) {
          Fluttertoast.showToast(msg: 'User Registered Successfully');
        } else {
          Fluttertoast.showToast(msg: 'User Registration Failed');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
