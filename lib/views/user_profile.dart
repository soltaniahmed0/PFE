import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});
  State<userProfile> createState() => _userProfile();
}

class _userProfile extends State<userProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  File ? image;
  ImageProvider? imageProvider;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
      print(image.runtimeType);
      setState(() => this.imageProvider = FileImage(File(image!.path)));

    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
      print(image.runtimeType);
      setState(() => this.imageProvider = FileImage(File(image!.path)));
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  controller: _scrollController,
                  children: [

                    Container(height: 20,),
                    SizedBox(

                        child: CircleAvatar(
                          radius: 200, // Set the radius
                          backgroundImage: imageProvider!=null?imageProvider:NetworkImage("https://media.licdn.com/dms/image/C5603AQENCO7lU05V8Q/profile-displayphoto-shrink_200_200/0/1668112809699?e=1683158400&v=beta&t=ioDhJx-XHrVdt606y5QRt2CDP06tpmrQjwZ655KHlsM"),

                        ),
                      width: 100,

                    ),
                    Container(height: 20,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          color: Colors.grey,
                          child:Text("Gallery")
                          ,

                          onPressed: () {
                            pickImage();
                          },),
                        MaterialButton(
                          color: Colors.grey,
                          child:Text("Camera")
                          ,

                          onPressed: () {
                            pickImageC();

                          },)
                      ],),
                    _createoneinfo(Icons.person_pin, 'Emplaoye name'),
                    _createoneinfo(Icons.key_outlined, 'Password'),
                    _createoneinfo(Icons.alternate_email, "Email"),
                    _createoneinfo(Icons.group, "Entreprise"),
                    _createoneinfo(Icons.work, "Job Title"),
                    _createoneinfo(Icons.phone, "phone number"),
                    Container(
                      height: 50,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.online_prediction),
                          Icon(Icons.lock_clock_rounded),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ));
  }

  _createoneinfo(IconData iconData, String info) {
    return Row(
      children: [
        Icon(iconData),
        Container(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(labelText: info),
          ),
        )
      ],
    );
  }}