import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../../../connection/connect.dart';
import '../../../../../../styles/style.dart';


class AddJewelleryDetails extends StatefulWidget {
  AddJewelleryDetails({Key? key, required this.indexNo,required this.rid}) : super(key: key);
  var indexNo,rid;
  @override
  _AddJewelleryDetailsState createState() => _AddJewelleryDetailsState();
}

var type;

class _AddJewelleryDetailsState extends State<AddJewelleryDetails> {
  @override
  void initState() {
    super.initState();
    switch(widget.indexNo){
      case 0: jewelType='Ring';
      break;
      case 1: jewelType='Choker';
      break;
      case 2: jewelType='Chutti';
      break;
      case 3: jewelType='Anklet';
      break;
      case 4: jewelType='Nose pin';
      break;
      case 5: jewelType='Bracelet';
      break;
      case 6: jewelType='Necklace';
      break;
      case 7: jewelType='Bangles';
      break;
      default: jewelType='Other';
      break;
    }

  }
  var jewelType;
  List size = ['small', 'medium', 'large', 'XL', 'XXL'];
  String? _selectedSize;
  String? _selectedType;
  // List type = [
  //   'Frock',
  //   'Gown',
  //   'Shirt',
  //   'T-Shirt',
  //   'Pants',
  //   'Tops',
  //   'Kurthis',
  //   'Salwars',
  //   'other'
  // ];

  File? _image;
  final picker = ImagePicker();

  TextEditingController description = TextEditingController();
  TextEditingController rent = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController material = TextEditingController();
  //var category;

  Future choiceImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future upload(File imageFile) async {


    print(name.text);
    print(description.text);
    print(rent.text);
    print(stock.text);
    print(jewelType);

    // print(category);
    print(_selectedSize);

    //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    //var length = await imageFile.length();
    var uri = Uri.parse("${Con.url}addJewel.php");

    var request = http.MultipartRequest("POST", uri);
    request.fields['jewelType'] = jewelType;
    request.fields['size'] = _selectedSize!;
    request.fields['rent'] = rent.text;
    request.fields['description'] = description.text;
    request.fields['stock'] = stock.text;
    request.fields['rid'] = widget.rid;

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Item added Successfully ...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));
      Navigator.pop(context);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Failed to add ...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));
      Navigator.pop(context);

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
              Center(
                  child: Text(
                    'Add Jewellery Details',
                    style: authHead,
                  )),
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
                  child: _image == null
                      ? Stack(children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          upload(_image!);
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            //color: Colors.red,
                            height: 200,
                            width: 250,
                            child: Center(
                                child:
                                Text('-- Click to select image --')),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 80,
                        top: 180,
                        child: ClipOval(
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.blueGrey[100],
                              child: IconButton(
                                icon: Icon(
                                  Icons.photo_camera_back_outlined,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  choiceImage();
                                },
                              ),
                            )))
                  ])
                      : Image.file(_image!),
                ),
              ),


              TextFormField(
                controller: description,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  label: Text(
                    'Description',
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  items: size
                      .map((e) => DropdownMenuItem<String>(
                    child: Text(
                      e,
                    ),
                    value: e,
                  ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedSize = val!;
                    });
                  },
                  value: _selectedSize,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '-- Select Size --',
                    ),
                  ),
                  isExpanded: true,
                ),
              ),
              SizedBox(
                height: 5,
              ),

              TextFormField(
                controller: rent,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Rate (in Rupees)',
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
                  label: Text(
                    'No. of Stocks',
                  ),
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
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        upload(_image!);
                      },
                      child: Center(
                          child: Text(
                            'Add',style: authBtn,
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
