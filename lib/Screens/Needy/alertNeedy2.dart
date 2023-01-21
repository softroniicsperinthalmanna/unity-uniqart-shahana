import 'package:flutter/material.dart';
class alertNeedy2 extends StatelessWidget {
  const alertNeedy2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('UNIQART'),
        centerTitle: true,
      ),
      body:
      Center(
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) =>
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // title: const Text("Alert Dialog Box"),
                    content: const Text("iam sorry!!!"
                        "But we have to refuse your request"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // print('Settings icon pressed');

                          //Navigator.of(ctx).pop();
                        },
                        child: Center(child: const Text("OK")),
                      ),
                      // TextButton(
                      // onPressed: () {
                      //   Navigator.of(ctx).pop();
                      // },
                      //  child: const Text("cancel"),
                      // ),
                    ],
                  ),
            );

            // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          },
          child: Container(
            height: 50,
            width: 100,
            color: Color(0xffD9D9D9),
            child: Center(
                child: Text('confirm', style: TextStyle(color: Colors.black),)),
          ),
        ),),
    );
  }
}
