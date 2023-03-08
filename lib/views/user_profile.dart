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
                    _createoneinfo(Icons.person_pin, 'Employee name',
                        TextEditingController(text: "ahmed"), false,"Employee_name"),
                    _createoneinfo(Icons.key_outlined, 'Password',
                        TextEditingController(text: "12546"), true,"Password"),
                    _createoneinfo(
                        Icons.alternate_email,
                        "Email",
                        TextEditingController(text: "ahmed0soltani@gmail.com"),
                        false,"Email"),
                    _createoneinfo(Icons.group, "Entreprise",
                        TextEditingController(text: "Medianet"), false,"Entreprise"),
                    _createoneinfo(Icons.work, "Job Title",
                        TextEditingController(text: "Mobile dev"), false,"Job_title"),
                    _createoneinfo(Icons.phone, "phone number",
                        TextEditingController(text: "12344875"), false,"Phone"),

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
  _createoneinfo(IconData iconData, String info,
      TextEditingController _defaultvalue, bool password,String type) {
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
  }
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

}