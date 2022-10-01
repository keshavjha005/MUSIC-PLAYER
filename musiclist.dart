import 'package:flutter/material.dart';
class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {

  List Songs=[
    {
      
      "name":"Ambarsariya",
      "thumbnail":"https://pagalsong.in/uploads//thumbnails/300x300/id3Picture_1314905516.jpg",
      "path":"songs/ambarsariya.mp3",
      "artist":"Sona Mohaptara",
      "genre":"Romance"

    },
    {
     
      "name":"Bad Liar",
      "thumbnail":"https://i1.sndcdn.com/artworks-ly1o8bFsg5848UdX-sAYyRA-t500x500.jpg",
      "path":"songs/badliar.mp3",
      "artist":"Imagine Dragons",
      "genre":"Romance/Action"

    },
    {
      
      "name":"Gulabi Aankhen",
      "thumbnail":"https://i.pinimg.com/736x/b1/da/83/b1da83557a969e2789ba30032af36706--audio.jpg",
      "path":"songs/gulabiaank.mp3",
      "artist":"Sanam",
      "genre":"Romance"

    },
    {
     
      "name":"Hymn For The Weekend",
      "thumbnail":"https://i.pinimg.com/736x/b1/da/83/b1da83557a969e2789ba30032af36706--audio.jpg",
      "path":"songs/hymnf.mp3",
      "artist":"Coldplay",
      "genre":"Motivation"

    },
    {
      
      "name":"Illahi",
      "thumbnail":"https://i.pinimg.com/736x/b1/da/83/b1da83557a969e2789ba30032af36706--audio.jpg",
      "path":"songs/illahi.mp3",
      "artist":"Arijit Singh",
      "genre":"Chill"

    },
    {
      
      "name":"Kesariya",
      "thumbnail":"https://i.pinimg.com/736x/b1/da/83/b1da83557a969e2789ba30032af36706--audio.jpg",
      "path":"songs/kesariya.mp3",
      "artist":"Arijit Singh",
      "genre":"Hardcore Love"

    },
    {
      "name":"Kyun Mai Jagoon",
      "thumbnail":"https://i.pinimg.com/736x/b1/da/83/b1da83557a969e2789ba30032af36706--audio.jpg",
      "path":"songs/kyunmai.mp3",
      "artist":"Shafqat Amant Ali",
      "genre":"Emotional"

    },
    {
      "name":"Phir Se Ud Chala",
      "thumbnail":"https://i.pinimg.com/736x/b1/da/83/b1da83557a969e2789ba30032af36706--audio.jpg",
      "path":"songs/udchala.mp3",
      "artist":"Mohit Chauhan",
      "genre":"Chill"

    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music List"),
        
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: Songs.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.network(Songs[index]["thumbnail"],width: 60,),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Songs[index]["name"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),),
                    Text(Songs[index]["artist"],textAlign: TextAlign.left,)
                  ],
                ),
                CircleAvatar(
                  child: IconButton(onPressed: (){
                    Navigator.pushNamed(context, "/player",arguments: {'index':index});
                  }, icon: Icon(Icons.play_arrow)),
                )
              ]),
            );
          }
          ),
      ),
     
    );
  }
}