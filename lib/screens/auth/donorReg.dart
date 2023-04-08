import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:uniqartapp/screens/auth/donorLogin.dart';
import 'package:uniqartapp/screens/auth/renterLogin.dart';
import 'package:uniqartapp/screens/auth/sellerLogin.dart';

import '../../connection/connect.dart';
import '../../styles/style.dart';
import '../../widgets/custSnackBar.dart';
import 'login.dart';
class DonorReg extends StatefulWidget {
  DonorReg({Key? key}) : super(key: key);
  // var userType;
  @override
  State<DonorReg> createState() => _DonorRegState();
}

class _DonorRegState extends State<DonorReg> {


  var dateList=[ DateTime(DateTime.now().year-2).year, DateTime(DateTime.now().year-1).year, DateTime.now().year, DateTime(DateTime.now().year+1).year, DateTime(DateTime.now().year+2).year];
  var deptList=['Maths','Physics','Computer Science','Chemistry','Biology','Food Technology','Psychology'];
  var degreeList=['UG','PG'];
  var nameCtrlr=TextEditingController();
  var colgIDCtrlr=TextEditingController();
  var dateCtrlr=TextEditingController();
  var emailCtrlr=TextEditingController();
  var phoneCtrlr=TextEditingController();
  var passwordCtrlr=TextEditingController();
  var selectedDept;
  var selectedYear;
  var degree;

  @override
  void initState(){
    super.initState();
    //  print(widget.userType);
  }

  Future<void> signUp() async {
    var data={
      "colgID":colgIDCtrlr.text,
      "password":passwordCtrlr.text,
    };
    var response= await post(Uri.parse('${Con.url}donorReg.php'),body: data);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      if(jsonDecode(response.body)['result']=='success'){
        ScaffoldMessenger.of(context).showSnackBar(snackMsg('Registered....'));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const DonorLogin()));

      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(errorSnackMsg('Failed to Register....'));


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DonorReg()));

      }
    }else throw Exception('Error returned');


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Create Account',style:GoogleFonts.russoOne(color: Colors.amber,fontSize: 28),),
      // ),
        body:Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: [
              Center(child: Text('Create Donor Account',style:authHead,)),
              SizedBox(height: 20,),

              // TextFormField(
              //     controller: nameCtrlr,
              //     keyboardType: TextInputType.name,
              //
              //     decoration: dec("Username")
              // ),

              TextFormField(
                  controller: colgIDCtrlr,
                  keyboardType: TextInputType.text,

                  decoration: dec("College ID")
              ),



              TextFormField(
                controller: passwordCtrlr,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                obscuringCharacter: '*',

                decoration: dec("Password"),

              ),
              SizedBox(height: 12,),


              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.amber
                      )

                  ),
                  onPressed: (){
                    signUp();
                    setState(() {

                    });

                    // print(nameController.text);
                  }, child: Text('Sign Up',style:authBtn))
            ],
          ),
        )
    );
  }

}
