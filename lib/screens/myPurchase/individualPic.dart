import 'package:flutter/material.dart';
class IndividualPicture extends StatefulWidget {
  var image;
   IndividualPicture({Key? key,required this.image}) : super(key: key);

  @override
  State<IndividualPicture> createState() => _IndividualPictureState();
}

class _IndividualPictureState extends State<IndividualPicture> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage('assets/images/college/${widget.image}',),
              fit: BoxFit.fill,
            ),

          ),
        ),
      ),
    );
  }
}
