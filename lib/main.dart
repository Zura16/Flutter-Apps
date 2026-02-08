// Aalind Kale
// CECS 453 assignment 1: Business Card
// Due: 02/09/2026
//importing teh flutter material library
import 'package:flutter/material.dart';

// main function to run the app.  without this, it won't run.,
void main() {
  runApp(const MyApp());
}
// Static widget cuz we won't need many changes after
class  MyApp extends StatelessWidget {
  const MyApp ({super.key });

// makin the UI of the app
  @override
  Widget build (BuildContext  context) {
    return  MaterialApp(
      // we don't need the debug banner
      debugShowCheckedModeBanner: false,
      // setting the  home screen to scaffold
      home:Scaffold (
        appBar:  AppBar(
          title: const Text('Business Card'),
        ),
        body: const Center (
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // column widget so everuthing is vertical
            children: <Widget>[
              Icon(Icons.email,size:90 ),
              // adding empty space
              SizedBox(height:10 ),
              // text widget
              Text(
                'Full Name' ,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:FontWeight.bold ,
                ),
              ),

              SizedBox (height:5),

              Text(
                'Title',
                style:  TextStyle(
                  fontSize:18,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 50) ,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget> [
                  Icon (Icons.phone) ,
                  SizedBox(width:10),
                  Text('+1 (408) 744-2542'),
                ],
              ),

              SizedBox (height: 10) ,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Icon(Icons.alternate_email) ,
                  SizedBox(width:10),
                  Text('@socialmediahandle'),
                ],
              ),

              SizedBox(height:10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Icon(Icons.email_outlined),
                  SizedBox(width:  10),
                  Text('kaleaalind7@gmail.com'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
