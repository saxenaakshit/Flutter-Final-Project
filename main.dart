import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      home: Screen0(),
    ),
  );
}

class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
              width: 500,
              height: 500,
              child: Image(image: NetworkImage('https://www.goteso.com/assets/images/training/banner/android-app-development-course.png',),)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Screen1();
              }));
            },
            child: const Text("Get Started"),
          ),
        ]),
      ),
    );
  }
}
class Screen1 extends StatefulWidget {
  Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var _secureText = true;
  String? _nameError = null;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passowrdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login info ",)),

      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                TextField(
                  maxLength: 20,
                  controller: _nameController,
                  decoration: InputDecoration(
                    errorText: _nameError,
                    labelText: "Name",
                    hintText: "Enter your Name",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password",
                    labelStyle: TextStyle(fontSize: 30, color: Colors.pink),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                        icon: Icon(
                          _secureText ? Icons.remove_red_eye : Icons.security,
                          color: Colors.orange,
                          size: 50,
                        )),
                  ),
                  // keyboardType: TextInputType.emailAddress,
                  obscureText: _secureText,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_nameController.text.length == 0)
                          _nameError = "Enter name";
                        else
                          _nameError = null;
                      });

                      print("Name: " + _nameController.text);
                    },
                    child: Text("Submit"))
              ],
            ),
          )),
    );
  }
}