import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:uniqartapp/widgets/custSnackBar.dart';

import '../../connection/connect.dart';
import '../../styles/style.dart';
import 'login.dart';
class StaffSignUp extends StatefulWidget {
  StaffSignUp({Key? key,required this.userType}) : super(key: key);
  var userType;
  @override
  State<StaffSignUp> createState() => _StaffSignUpState();
}

class _StaffSignUpState extends State<StaffSignUp> {


  var deptList=['Maths','Physics','Computer Science','Chemistry','Biology','Food Technology','Psychology','Other'];
  var staffType=['Teaching','Non-Teaching','Adhoc'];
  var nameCtrlr=TextEditingController();
  var colgIDCtrlr=TextEditingController();
  var emailCtrlr=TextEditingController();
  var phoneCtrlr=TextEditingController();
  var passwordCtrlr=TextEditingController();
  var selectedDept;
  var selectedType;

  @override
  void initState(){
    super.initState();
    print(widget.userType);
  }

  Future<void> signUp() async {
    var data={
      "name":nameCtrlr.text,
      "colgID":colgIDCtrlr.text,
      "dept":selectedDept,
      "email":emailCtrlr.text,
      "phone":phoneCtrlr.text,
      "password":passwordCtrlr.text,
      "userType":widget.userType,
      "staffType":selectedType
    };
    var response= await post(Uri.parse('${Con.url}staffSignUp.php'),body: data);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      if(jsonDecode(response.body)['result']=='success'){
        ScaffoldMessenger.of(context).showSnackBar(snackMsg('Registered....'));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignIn()));

      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(errorSnackMsg('Failed to Register....'));


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StaffSignUp(userType: 'staff')));

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
              Center(child: Text('Create Account',style:authHead,)),
              SizedBox(height: 20,),

              TextFormField(
                  controller: nameCtrlr,
                  keyboardType: TextInputType.name,

                  decoration: dec("Username")
              ),

              TextFormField(
                  controller: colgIDCtrlr,
                  keyboardType: TextInputType.text,

                  decoration: dec("College ID")
              ),
              Container(
                //   color:Color(0xffD9D9D9),
                child: DropdownButton(
                  items:deptList.map((e) => DropdownMenuItem<String>(child: Text(e),value: e,)).toList(),
                  onChanged: (val){
                    setState(() {
                      selectedDept=val!;
                    });
                  },
                  value: selectedDept,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Department',),
                  ),
                  isExpanded: true,

                ),
              ),
              Container(
                //   color:Color(0xffD9D9D9),
                child: DropdownButton(
                  items:staffType.map((e) => DropdownMenuItem<String>(child: Text(e),value: e,)).toList(),
                  onChanged: (val){
                    setState(() {
                      selectedType=val!;
                    });
                  },
                  value: selectedType,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Staff Type',),
                  ),
                  isExpanded: true,

                ),
              ),



              TextFormField(
                controller: emailCtrlr,
                keyboardType: TextInputType.emailAddress,

                decoration: dec("Email"),
              ),
              TextFormField(
                controller: phoneCtrlr,
                keyboardType: TextInputType.phone,

                decoration: dec("Mobile"),

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
