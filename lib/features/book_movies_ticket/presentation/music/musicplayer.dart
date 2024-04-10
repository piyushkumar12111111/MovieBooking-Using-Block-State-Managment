
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  
  //! http://localhost:8080/api/v1/musics
 
 Future<List<dynamic>> getMusic() async {
    final response = await http.get(Uri.parse('http://192.168.85.111:8080/api/v1/musics'));
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
  }
  
  
  Widget build(BuildContext context) {
    return Scaffold(body: 
    
    
    Column(
      children: [
         Text("Music Player")
    
      //  FutureBuilder(
      //    future: getMusic(),
      //    initialData: [],
      //    builder: (BuildContext context, AsyncSnapshot snapshot) {
      //      return ListView.builder(
      //         shrinkWrap: true,
              
      //        itemCount: snapshot.data.length,
      //        itemBuilder: (BuildContext context, int index) {
      //          return ListTile(
      //            title: Text(snapshot.data[index]['title']),
      //            subtitle: Text(snapshot.data[index]['artist']),
      //            trailing: Text(snapshot.data[index]['year']),
      //            autofocus: true,
      //            //leading: Image.network(snapshot.data[index]['cover']),
      //          );
      //        },
      //      );
      //    },
      //  ),
    
      ],
    ));
  }
}