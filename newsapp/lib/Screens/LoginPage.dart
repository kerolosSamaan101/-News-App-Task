import 'package:flutter/material.dart';
import 'package:newsapp/Screens/NewsPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _emailController = new TextEditingController();
  final _passController = new TextEditingController();
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Login Page",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Email Text Field
              SizedBox(
                width: 500,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    suffixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Password Text Field
              SizedBox(
                width: 500,
                child: TextField(
                  controller: _passController,
                  obscureText: !isPressed,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      // make password visible or not visible when clicking on the icon
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: isPressed
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Login Button
              ElevatedButton(
                  // if user does not enter email or password or both
                  onPressed: () {
                    if (_emailController.text.isEmpty ||
                        _passController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Enter Complete and Correct Data"),
                      ));
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => Newspage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
