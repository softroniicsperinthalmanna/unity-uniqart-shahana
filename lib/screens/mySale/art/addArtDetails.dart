import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../connection/connect.dart';
import '../../../styles/style.dart';

class AddArtDetails extends StatefulWidget {
   AddArtDetails({Key? key,required this.indexNo,required this.vid}) : super(key: key);
var indexNo,vid;
  @override
  _AddArtDetailsState createState() => _AddArtDetailsState();
}

class _AddArtDetailsState extends State<AddArtDetails> {

  @override
  void initState(){
    super.initState();
    switch(widget.indexNo){
      case 0: category='Calligraphy';print(category);break;
      case 1: category='Paintings';break;
      case 2: category='Gift Hamper';break;
      case 3: category='Save the Date';break;
      case 4: category='Mehandi';break;
      default: category='Other';break;
    }

    print(category);


  }


  File? _image;
  final picker = ImagePicker();



  TextEditingController nameContr = TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController rate=TextEditingController();
  TextEditingController stock=TextEditingController();
  TextEditingController name=TextEditingController();
  var category;


  Future choiceImage()async{
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }



  Future upload(File imageFile)async{
    print(name.text);
    print(description.text);
    print(rate.text);
    print(stock.text);
    print(category);

    //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    //var length = await imageFile.length();
    //var uri = Uri.parse("${Con.url}/addArt.php");
    var uri = Uri.parse("${Con.url}/addArt.php");

    var request = http.MultipartRequest("POST",uri);
    request.fields['artName'] = name.text;
    request.fields['artType'] = category;
    request.fields['rate'] = rate.text;
    request.fields['description'] = description.text;
    request.fields['stock'] = stock.text;
    // request.fields['category'] = 'art';
    request.fields['vid'] = widget.vid;

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
    }else{
      print("uploaded faild");
    }

    nameContr.text = "";


  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Center(child: Text('Add Art Details ',style: authHead,)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  //     child: _image == null ? Text('No image selected') : Image.file(_image!),
                  child: _image == null ? Stack(
                      children:[
                        Center(
                          child: InkWell(
                            onTap:(){
                              upload(_image!);
                            },
                            child: Card(

                              elevation: 5,
                              child: Container(
                                //color: Colors.red,
                                height: 200,
                                width: 250,
                                child: Center(child: Text('-- Click to select image --'))
                                ,),
                            ),
                          ),
                        ),
                        Positioned(right: 80,top: 185,
                            child: ClipOval(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.blueGrey[100],
                                  child: IconButton(
                                    icon:Icon(Icons.photo_camera_back_outlined,size: 30,color: Colors.red,),
                                    onPressed: (){
                                      choiceImage();
                                    },),
                                )
                            )
                        )
                      ] ) : Image.file(_image!),
                ),
              ),

              TextFormField(
                controller: name,

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label:Text('Product Name'),

                ),
              ),
              SizedBox(
                height: 5,
              ),

              TextFormField(
                controller: description,
                keyboardType: TextInputType.text,
               // maxLines: 5,
                maxLength: 300,
                maxLines: 3,
                decoration: InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label:Text('Description' ),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: rate,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text('Rate (in Rupees)',   ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  width: 120,
                  height: 40,
                  child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                       // backgroundColor: color,
                      ),
                      onPressed: (){
                        upload(_image!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added Successfully ...',style: TextStyle(fontSize: 20,color: Colors.white),),
                          backgroundColor:  Color(
                              0xfa8f7805),));
                        Navigator.pop(context);
                      }, child:  Center(child: Text('Add',style:authBtn))
                  ),
                ),
              ),


              const SizedBox(
                height: 24,
              ),



              // ElevatedButton(child: Text('Upload Image'),
              //   onPressed: (){
              //     upload(_image!);
              //   },),



            ],
          ),
        ),
      ),
    );
  }
}