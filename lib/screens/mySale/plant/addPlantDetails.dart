import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../connection/connect.dart';
import '../../../styles/style.dart';

class AddPlantDetails extends StatefulWidget {
  AddPlantDetails({Key? key,required this.indexNo}) : super(key: key);
  var indexNo;
  @override
  _AddPlantDetailsState createState() => _AddPlantDetailsState();
}

class _AddPlantDetailsState extends State<AddPlantDetails> {

  @override
  void initState(){
    super.initState();
    switch(widget.indexNo){
      case 0: category='Indoor';print(category);break;
      case 1: category='Outdoor';break;
      case 2: category='Seed';break;
      case 3: category='Vegetation';break;
      default: category='Other';break;
    }

    print(category);


  }


  File? _image;
  final picker = ImagePicker();



  //TextEditingController nameContr = TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController rate=TextEditingController();
  TextEditingController stock=TextEditingController();
  TextEditingController name=TextEditingController();
  var category;
  var _selectedSize;
  List size=['Small','Medium','Large','Not Applicable'];

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
    var uri = Uri.parse("${Con.url}addPlant.php");

    var request = http.MultipartRequest("POST",uri);
    request.fields['plantName'] = name.text;
    request.fields['plantType'] = category;
    request.fields['rate'] = rate.text;
    request.fields['description'] = description.text;
    request.fields['stock'] = stock.text;
    request.fields['size'] = _selectedSize;

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

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Center(child: Text('Add Plant Details',style: authHead,)),
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
                        Positioned(right: 80,top: 180,
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
                height: 5,
              ),
              TextFormField(
                controller: name,

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label:Text('Plant Name',),

                ),
              ),
              SizedBox(
                height: 5,
              ),

              TextFormField(
                controller: description,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  label:Text('Description',),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  items:size.map((e) => DropdownMenuItem<String>(child: Text(e,),value: e,)).toList(),
                  onChanged: (val){
                    setState(() {
                      _selectedSize=val!;
                    });
                  },
                  value: _selectedSize,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('-- Select Size --',),
                  ),
                  isExpanded: true,

                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: rate,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Rate (in Rupees)',
                  ),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: stock,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label:  Text('No. of Stocks', ),

                ),
              ),

              SizedBox(
                height: 5,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  width: 120,
                  height: 40,
                  child: OutlinedButton(
                      style: ElevatedButton.styleFrom(

                      ),
                      onPressed: (){
                        upload(_image!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added Successfully ...',style: TextStyle(fontSize: 20,color: Colors.white),),
                          backgroundColor:  Color(
                              0xfa8f7805),));
                        Navigator.pop(context);
                      }, child:  Center(child: Text('Add',style: authBtn,))
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