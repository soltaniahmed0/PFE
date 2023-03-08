import 'package:flutter/material.dart';
import 'package:frontend/views/calender.dart';
import 'package:frontend/views/food_menu.dart';
import 'package:frontend/views/user_profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrangeAccent,
          title: Padding(padding: EdgeInsets.only(left: 50),child: const Text('Ahmed Soltani')),
        actions: [
          InkWell(
            child: CircleAvatar(
            radius: 26, // Set the radius
            backgroundImage:  NetworkImage(
              "https://media.licdn.com/dms/image/C5603AQENCO7lU05V8Q/profile-displayphoto-shrink_200_200/0/1668112809699?e=1683158400&v=beta&t=ioDhJx-XHrVdt606y5QRt2CDP06tpmrQjwZ655KHlsM",

            ),

          ),
          onTap:()=>

            {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      body: userProfile(),
                    );


                  },
                ),


                )



              },
  )]),
      body: Container(

        child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              _button('https://imageio.forbes.com/specials-images/imageserve/61ffec2d637d7cf26fb672f0/In-many-organizations--the-employees-are-working-for-more-than-money--They-are/960x0.jpg?format=jpg&width=960',"Emploees"),
              _button('https://www.shutterstock.com/image-photo/online-video-conference-social-distancing-260nw-1813788023.jpg',"Rooms"),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDs6GZLoFxlzu7AsjW7TlAF4YJVuerl2LSzs_Q7RcMERrqW46CrezhQRBHKOxMATHWMYQ&usqp=CAU',"Snacks"),
              _button('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvyoQQHFG4xDWAOifhdjKnWX08TeSd-rVUqQ&usqp=CAU',"Food"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh5uq5FxhrUnhT9aeD9-fR2bUP01jVc0LIqyCYMsKWukE_zpjHUhXUrtL3mpKfiNiuzqk&usqp=CAU',"Lost & Found"),
              _button('https://rsquare2014.com/wp-content/uploads/2017/02/External-Events-banner_2.png',"Events"),
            ],
          )
        ],
      ),
      ),
    );
  }

  _button(String url,String txt) {
    return
      InkWell(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                url,
              ),
            ),
            Container(height: 8,),
            Text(txt,style: TextStyle(fontSize: 20),),
          ],
        ),
        onTap: () {
          if(txt=="Food"){

            Navigator.push(context,
            MaterialPageRoute(builder: (context) => recette(),),);
          }
          else if(txt=="Rooms"){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => EventCalendarScreen(),),);
          }
          else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(txt)));
          }
        },
      );


  }
}
