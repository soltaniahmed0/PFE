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
                    _createoneinfo(Icons.person_pin, 'Emplaoye name',false),
                    _createoneinfo(Icons.key_outlined, 'Password',true),
                    _createoneinfo(Icons.alternate_email, "Email",false),
                    _createoneinfo(Icons.group, "Entreprise",false),
                    _createoneinfo(Icons.work, "Job Title",false),
                    _createoneinfo(Icons.phone, "phone number",false),
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
  bool _obscureText = true;
  _createoneinfo(IconData iconData, String info,bool password) {
    return Row(
      children: [
        Icon(iconData),
        Container(
          width: 10,
        ),
        Expanded(
            child: Stack(children: [
              TextFormField(
                obscureText: password ? _obscureText : false,
                controller: _defaultvalue,
                decoration: InputDecoration(labelText: info),
                textAlign: TextAlign.left,
              ),

              if (password)
                Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                        onTap: () {
                          _togglePasswordVisibility();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                        )))
            ]))
      ],
    );
  }}