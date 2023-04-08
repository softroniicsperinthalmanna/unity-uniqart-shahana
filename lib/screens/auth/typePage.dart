import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniqartapp/screens/auth/register.dart';
import 'package:uniqartapp/screens/auth/staffRegister.dart';

import '../../styles/style.dart';
class ChooseTypePage extends StatelessWidget {
  const ChooseTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: ListView(
          children: [
            SizedBox(height: 80,),

            Center(
              child: RichText(
                  text: TextSpan(text: 'Welcome\n ', style: authHead, children: [
                    TextSpan(text: 'to ', style: authHead, children: [
                      TextSpan(
                          text: 'UN!QART',
                          style: GoogleFonts.russoOne(
                              color: Color(0xff458F9D), fontSize: 45))
                    ])
                  ])),
            ),
            SizedBox(height: 90,),
            OutlinedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(userType: 'Student')));

            },
                child: Text('Sign up as Student')),
            SizedBox(height: 35,),

            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffSignUp(userType: 'Staff')));

            }, child: Text('Sign up as Staff')),
          ],
        ),
      ),
    );
  }
}
