import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../connection/connect.dart';
import '../../styles/style.dart';
import '../../widgets/custSnackBar.dart';
import 'login.dart';
class SignUp extends StatefulWidget {
   SignUp({Key? key,required this.userType}) : super(key: key);
  var userType;
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


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
    print(widget.userType);
  }

  Future<void> signUp() async {
    var data={
      "name":nameCtrlr.text,
      "colgID":colgIDCtrlr.text,
      "dept":selectedDept,
      "academicYear":selectedYear.toString(),
      "level":degree,
      "email":emailCtrlr.text,
      "phone":phoneCtrlr.text,
      "password":passwordCtrlr.text,
      "userType":widget.userType
    };
    var response= await post(Uri.parse('${Con.url}studentSignUp.php'),body: data);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      if(jsonDecode(response.body)['result']=='success'){
        ScaffoldMessenger.of(context).showSnackBar(snackMsg('Registered....'));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignIn()));

      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(errorSnackMsg('Failed to Register....'));


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp(userType: 'student')));

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
                  items:degreeList.map((e) => DropdownMenuItem<String>(child: Text(e,),value: e,)).toList(),
                  onChanged: (val){
                    setState(() {
                      degree=val!;
                    });
                  },
                  value: degree,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Degree'),
                  ),
                  isExpanded: true,

                ),
              ),
              Container(
             //   color:Color(0xffD9D9D9),
                child: DropdownButton(
                  items:dateList.map((e) => DropdownMenuItem<dynamic>(child: Text(e.toString(),),value: e,)).toList(),
                  onChanged: (val){
                    setState(() {
                      selectedYear=val;
                    });
                  },
                  value: selectedYear,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Date of College Join'),
                  ),
                  isExpanded: true,

                ),
              ),
              // TextField(
              //   controller: dateCtrlr,
              //   //editing controller of this TextField
              //   decoration: InputDecoration(
              //       icon: Icon(Icons.calendar_today), //icon of text field
              //       labelText: "Academic Year" //label text of field
              //   ),
              //   readOnly: true,
              //   //set it true, so that user will not able to edit text
              //   onTap: () async {
              //     DateTime? pickedDate = await showDatePicker(
              //         context: context,
              //         initialDate: DateTime.now(),
              //         firstDate: DateTime(DateTime.now().year-2),
              //         // firstDate: DateTime(1950),
              //         //DateTime.now() - not to allow to choose before today.
              //         lastDate: DateTime(DateTime.now().year+2));
              //
              //     if (pickedDate != null) {
              //       print(
              //           pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              //       String formattedDate =
              //       DateFormat('yyyy-MM-dd').format(pickedDate);
              //       print(
              //           formattedDate); //formatted date output using intl package =>  2021-03-16
              //       setState(() {
              //         dateCtrlr.text =
              //             formattedDate; //set output date to TextField value.
              //       });
              //     } else {}
              //   },
              // ),



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
