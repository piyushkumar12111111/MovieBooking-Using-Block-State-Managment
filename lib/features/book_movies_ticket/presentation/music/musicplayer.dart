
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';


class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  
  //! http://localhost:8080/api/v1/musics
 
 Future<List<dynamic>> getMusic() async {
    final response = await http.get(Uri.parse('http://192.168.28.111:8080/api/v1/musics'));
    if (response.statusCode == 200) {
      final List<dynamic> music = json.decode(response.body);
      print(music);
      return music;
      
    } else {
       return [];
      throw Exception('Failed to load music');
    }
  }

  @override
  void initState() {
    super.initState();
    getMusic();
    // Time.async(Duration(seconds: 5), () {
    //   setState(() {
    //     isPlaying = false;
    //   });
    // });
  }
  
  bool isPlaying = true;
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: 
    
    
    Column(
      children: [
        
       FutureBuilder(
         future: getMusic(),
         initialData: [],
         builder: (BuildContext context, AsyncSnapshot snapshot) {
           return ListView.builder(
              shrinkWrap: true,
              
             itemCount: snapshot.data.length,
             itemBuilder: (BuildContext context, int index) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                  decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.deepPurple, Colors.redAccent],
                        ),
                  ),
                   child: Stack(
                     children: [
                      // Shimmer.fromColors(
                      //   baseColor: Colors.grey,
                      //   highlightColor: Colors.black,
                      //   child: Container(
                      //     height: 80,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(25),
                      //     ),
                      //   ),
                      // ),
                       ListTile(
                         title: Text(snapshot.data[index]['title'], style: TextStyle(color: Colors.white),),
                         subtitle: Text(snapshot.data[index]['artist'], style: TextStyle(color: Colors.white)),
                         trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.play_arrow, color: Colors.black),
                          )),
                         autofocus: true,
                         leading: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzONA5UEZBZfg73pA7bokhkyu2BP2Rmk_z7VTwHmaOY_B62DaC0FNDobAbVPB4DxXsFtE&usqp=CAU',fit: BoxFit.cover),
                       ),
                     ],
                   ),
                 ),
               );
             },
           );
         },
       ),
    
      ],
    ));
  }
}