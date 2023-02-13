import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../connection/connect.dart';
import '../../../../styles/style.dart';


class AddUniformDetails extends StatefulWidget {
  AddUniformDetails({Key? key,required this.indexNo}) : super(key: key);
  var indexNo;
  @override
  _AddUniformDetailsState createState() => _AddUniformDetailsState();
}
var type;
class _AddUniformDetailsState extends State<AddUniformDetails> {
  @override
  void initState(){
    super.initState();

  }

  List size=['small','medium','large','XL','XXL'];
  String? _selectedSize;
  String? _selectedType;
  List type=['Frock','Gown','Shirt','T-Shirt','Pants','Tops','Kurthis','Salwars','other'];


  File? _image;
  final picker = ImagePicker();



  TextEditingController description=TextEditingController();
  TextEditingController rate=TextEditingController();
  TextEditingController stock=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController material=TextEditingController();
  //var category;

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

    // print(category);
    print(_selectedSize);


    //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    //var length = await imageFile.length();
    var uri = Uri.parse("${Con.url}addCloth.php");

    var request = http.MultipartRequest("POST",uri);
    request.fields['clothName'] = name.text;
    request.fields['clothType'] = name.text;
    request.fields['size'] = _selectedSize!;
    request.fields['rate'] = rate.text;
    request.fields['description'] = description.text;
    request.fields['stock'] = stock.text;
    request.fields['material'] = material.text;

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
    }else{
      print("uploaded failed");
    }

    // nameContr.text = "";


  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Cloth Details'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                // TextField(
                //   controller: nameContr,
                //   decoration: InputDecoration(
                //       labelText: 'Name'
                //   ),
                // ),
                //
                //
                // IconButton(icon: Icon(Icons.camera),
                //   onPressed: (){
                //     choiceImage();
                //   },),
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
                                  height: 250,
                                  width: 370,
                                  child: Center(child: Text('-- Click to select image --'))
                                  ,),
                              ),
                            ),
                          ),
                          Positioned(right: 80,top: 200,
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  //  height: 200,

                  color: Color(0xffD9D9D9),
                  padding: EdgeInsets.all(8),
                  child:  TextFormField(
                    controller: name,

                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label:Text('Product Name', style:heading1
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color:Color(0xffD9D9D9),
                    child: DropdownButton(
                      items:type.map((e) => DropdownMenuItem<String>(child: Text(e,style: heading1,),value: e,)).toList(),
                      onChanged: (val){
                        setState(() {
                          _selectedType=val!;
                        });
                      },
                      value: _selectedType,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('-- Select type --',style: heading1,),
                      ),
                      isExpanded: true,

                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Container(
                  //  height: 200,

                  color: Color(0xffD9D9D9),
                  padding: EdgeInsets.all(8),
                  child:  TextFormField(
                    controller: description,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label:Text('Description', style:heading1
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color:Color(0xffD9D9D9),
                    child: DropdownButton(
                      items:size.map((e) => DropdownMenuItem<String>(child: Text(e,style: heading1,),value: e,)).toList(),
                      onChanged: (val){
                        setState(() {
                          _selectedSize=val!;
                        });
                      },
                      value: _selectedSize,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('-- Select Size --',style: heading1,),
                      ),
                      isExpanded: true,

                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //  height: 200,

                  color: Color(0xffD9D9D9),
                  padding: EdgeInsets.all(8),
                  child:  TextFormField(
                    controller: material,

                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label: Text('Material Type', style:heading1
                      ),

                    ),
                  ),
                ),



                SizedBox(
                  height: 10,
                ),
                Container(
                  //  height: 200,

                  color: Color(0xffD9D9D9),
                  padding: EdgeInsets.all(8),
                  child:  TextFormField(
                    controller: rate,

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label: Text('Rate (in Rupees)', style:heading1
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //  height: 200,

                  color: Color(0xffD9D9D9),
                  padding: EdgeInsets.all(8),
                  child:  TextFormField(
                    controller: stock,

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label:  Text('No. of Stocks', style:heading1
                      ),

                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                        ),
                        onPressed: (){
                          upload(_image!);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added Successfully ...',style: TextStyle(fontSize: 20,color: Colors.white),),
                            backgroundColor:  Color(
                                0xfa8f7805),));
                          Navigator.pop(context);
                        }, child:  Center(child: Text('Add',style: heading1,))
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
      ),
    );
  }
}