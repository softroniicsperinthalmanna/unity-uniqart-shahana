import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../connection/connect.dart';
import '../../../styles/style.dart';
class EditArt extends StatefulWidget {
  EditArt({Key? key,required this.logId,required this.pid,required this.rate}) : super(key: key);
  var logId;
  var pid,rate;

  @override
  State<EditArt> createState() => _EditArtState();
}

class _EditArtState extends State<EditArt> {
  var catImage;
  var catText;

  Future<dynamic> getData() async {
    var data={
      "log_id":widget.logId.toString()
    };
    var response=await post(Uri.parse("${Con.url}getMyCategory.php",),body: data);
    print(response.body);
    print(response.statusCode);

    return jsonDecode(response.body);
  }
  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(),
        )
    );
  }
}
