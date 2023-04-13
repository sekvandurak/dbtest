import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  //final firebaseAuth = FirebaseAuth.instance;
  //final authService = AuthService();
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
              emailTextField(),
              customSizedBox(),
              passwordTextField(),
              customSizedBox(),
              forgotPasswordButton(),
              customSizedBox(),
              signInButton(),
              signUpButton(),
              customSizedBox(),
              /*CustomTextButton(
                      onPressed: () => Navigator.pushNamed(context, "/signUp"),
                      buttonText: "Hesap Olustur",
                    ),
                    CustomTextButton(
                        onPressed: () async {
                          final result = await authService.signInAnonymous();
                          if (result != null) {
                            Navigator.pushReplacementNamed(
                                context, "/homePage");
                          } else {
                            print("Hata ile karsilasildi");
                          }
                        },
                        buttonText: "Misafir Girisi")*/
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

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: TextStyle(color: Colors.white60),
      decoration: customInputDecoration("Password", iconForPassword()),
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
        onPressed: () {},
        child: Container(
          height: 50,
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xff31274F)),
          child: Center(
            child: customText("Log in", Colors.white60),
          ),
        ),
      ),
    );
  }

  Center signUpButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dont have an account? Please',
              style: TextStyle(color: Colors.white)),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, "/signUp"),
            child: customText(
              "Sign up!",
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
}
