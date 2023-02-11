import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("UNIQART",style: TextStyle(fontSize: 36,)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text("College id:"),
                      Expanded(child: TextFormField())
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text("Category:"),
                      Expanded(child: DropdownButtonFormField(
                        items: [],
                        onChanged: (val){},

                      ))
                    ],
                  ),
                )
              ],
            ),
        ),
      );
  }
}
