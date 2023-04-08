import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:uniqartapp/screens/auth/donorReg.dart';
import 'package:uniqartapp/screens/auth/register.dart';
import 'package:uniqartapp/screens/auth/sellerReg.dart';
import 'package:uniqartapp/screens/auth/typePage.dart';
import 'package:uniqartapp/screens/donate/donorIndexHome.dart';
import 'package:uniqartapp/screens/mySale/sellerHome.dart';
import 'package:uniqartapp/screens/toLease/Dashboard/rentalIndexHome.dart';
import 'package:uniqartapp/styles/style.dart';

import '../../connection/connect.dart';
import '../../widgets/custSnackBar.dart';
import '../myPurchase/purchaseCatelog.dart';
import '../myPurchase/purchaseHome.dart';
import '../service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonorLogin extends StatefulWidget {
  const DonorLogin({Key? key}) : super(key: key);

  @override
  State<DonorLogin> createState() => _DonorLoginState();
}

class _DonorLoginState extends State<DonorLogin> {
  // Future<void> setLogId() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('login_id', loginID);
  //
  // }

  var colgIDCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();
  var flag=0;
  var donorid;
  var userType;
  Future<dynamic> signIn() async {
    var data = {
      "colgID": colgIDCtrlr.text,
      "password": passwordCtrlr.text
    };
    var response = await post(Uri.parse('${Con.url}donorLogin.php'), body: data);
    print(response.body);
    print(response.statusCode);

    donorid=jsonDecode(response.body)['donorid'];
    // userType=jsonDecode(response.body)['userType'];
    print(donorid);
    print(userType);
    if(response.statusCode==200){
      if(jsonDecode(response.body)['message']=='User Successfully Logged In') {
        flag = 1;
        print('flag value:$flag');
        //print(loginID);

        if (flag == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
              snackMsg('Logging In ...'));
          //  print(loginID);
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => SellerHome(
          //
          //       logId: loginID.toString(),
          //     )));
          //  setLogId();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DonorIndexHome(

                logId: donorid,
              )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              errorSnackMsg('Login Failed'));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DonorLogin()));
        }
      }


      else {

        ScaffoldMessenger.of(context).showSnackBar(
            errorSnackMsg('Login Failed'));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DonorLogin()));
      }
      return jsonDecode(response.body);



    }
    else{
      return Center(child: CircularProgressIndicator());
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 130),
            child: ListView(
              children: [

                Center(
                  child: RichText(
                      text: TextSpan(text: 'Welcome\n ', style: authHead, children: [
                        TextSpan(text: 'to ', style: authHead, children: [
                          TextSpan(
                              text: 'UN!QART',
                              style: GoogleFonts.russoOne(
                                  color: Color(0xff458F9D), fontSize: 45)),
                          TextSpan(
                              text: '\nDonor',
                              style: authHead),
                        ])
                      ])),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: colgIDCtrlr,
                  keyboardType: TextInputType.text,
                  decoration: dec("College ID"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordCtrlr,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: dec("Password"),
                ),
                SizedBox(
                  height: 30,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.amber)),
                    onPressed: () {
                      signIn();
                      print('Flag inside button $flag');

                      setState(() {

                      }

                      );

                      //  print(emailController.text);
                    },
                    child: Text(
                      'Sign In',
                      style: authBtn,
                    )),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>DonorReg ()));
                      //  print(emailController.text);
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Not Registered Yet?',
                          style: GoogleFonts.russoOne(color: Colors.amber),
                          children: [
                            TextSpan(
                                text: ' Sign Up',
                                style: GoogleFonts.russoOne(
                                    color: Colors.red, fontSize: 18))
                          ]),
                    ))
              ],
            )






        )
    );
  }
}
