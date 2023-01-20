import 'package:flutter/material.dart';
class Needy extends StatefulWidget {
  const Needy({Key? key}) : super(key: key);

  @override
  State<Needy> createState() => _NeedyState();
}

class _NeedyState extends State<Needy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
      backgroundColor: Color(0xff456F64),
        title:const Text("UNIQART"),

        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 50,),
           // Text("Name:"),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Name'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide()
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide()
                )
              ),
            ),
            SizedBox(height: 20,),

            TextFormField(
              decoration: InputDecoration(
             //   label: Text('Name'),
                hintText: 'MyName',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide()
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide()
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
