import 'package:flutter/material.dart';

void main() {
  runApp(const ArtSpaceApp());
}

class ArtSpaceApp  extends StatelessWidget {
  const ArtSpaceApp({super. key});

  @override
  Widget build(BuildContext context ) {
    return MaterialApp(
      title :  'Art Space',
      debugShowCheckedModeBanner: false ,
      home:const ArtSpaceScreen(),
    );
  }
}

class Artwork  {
  final String title;
  final String artist ;
  final int year;
  final String assetPath ;

  const Artwork( {
    required this. title,
    required  this.artist,
    required this.year,
    required this.assetPath ,
  });
}

class ArtSpaceScreen  extends StatefulWidget{
  const ArtSpaceScreen({super.key});

  @override
  State<ArtSpaceScreen>  createState() => _ArtSpaceScreenState();
}

class _ArtSpaceScreenState  extends State<ArtSpaceScreen> {
  final List<Artwork> artworks = const [
    Artwork(
      title :  'The Starry Night',
      artist: 'Vincent van Gogh',
      year : 1889 ,
      assetPath: 'assets/images/Starry_Night.png',
    ),
    Artwork( 
      title: 'Worn Out' ,
      artist: 'Vincent van Gogh',
      year: 1890,
      assetPath: 'assets/images/Worn_Out.png',
    ),
    Artwork (
      title: 'Self Portrait',
      artist: 'Vincent van Gogh',
      year: 1890,
      assetPath: 'assets/images/Self_Portrait.png',
    ),
  ];

  int index = 0 ;

  void  goPrevious() {
    setState (() {
      index =  (index - 1 + artworks.length) % artworks.length;
    });
  }

  void goNext() {
    setState(()  {
      index =(index + 1)%artworks. length;
    });
  }

  @override
  Widget build(BuildContext context)  {
    final Artwork current =artworks[index];

    return Scaffold(
      backgroundColor:const Color(0xFFF6F3F9),
      body: SafeArea (
        child: Padding( 
          padding: const EdgeInsets.all(24.0),
          child: Column (
            children: [
              // 1) Artwork wall
              Expanded (
                child:Center(
                  child:  Container(
                    padding:const EdgeInsets.all(16),
                    decoration:BoxDecoration (
                      color: Colors.white,
                      boxShadow:const [
                        BoxShadow (
                          blurRadius:14,
                          spreadRadius: 1,
                          offset: Offset(0, 6),
                          color: Color(0x22000000),
                        ),
                      ],
                      borderRadius:BorderRadius.circular( 6),
                    ),
                    child: AspectRatio(
                      aspectRatio:3/  4,
                      child: Image.asset(
                        current.assetPath ,
                        fit: BoxFit.cover ,
                        errorBuilder: (_, __, ___) {
                          return const Center(
                            child: Text(
                              'Image not found.\nCheck assets + pubspec.yaml',
                              textAlign:TextAlign.center ,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height:24),

              // 2) Artwork descriptor
              Container (
                width:double.infinity ,
                padding:const EdgeInsets.all(16),
                decoration :  BoxDecoration(
                  color: const  Color(0xFFE9E4F1),
                  borderRadius : BorderRadius.circular(6),
                ),
                child:Column(
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children:[
                    Text(
                      current.title,
                      style: const  TextStyle(
                        fontSize:22,
                        fontWeight: FontWeight.w500 ,
                      ),
                    ),
                    const SizedBox( height: 6),
                    RichText(
                      text: TextSpan(
                        style:const TextStyle(fontSize: 14, color: Colors.black87),
                        children: [
                          TextSpan(
                            text: current.artist,
                            style:const TextStyle(fontWeight:  FontWeight.bold),
                          ),
                          TextSpan(text:' (${current.year})'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height:  20),

              // 3) Display controller
              Row(
                children:[
                  Expanded(
                    child: SizedBox(
                      height:  44,
                      child:  ElevatedButton(
                        onPressed:goPrevious ,
                        child:const  Text('Previous'),
                      ),
                    ),
                  ),
                  const SizedBox( width: 16),
                  Expanded(
                    child:  SizedBox(
                      height: 44,
                      child:ElevatedButton(
                        onPressed: goNext,
                        child:const Text(  'Next'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
