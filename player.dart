import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

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

  final audioPlayer=AudioPlayer();
  bool isPlaying=false;
  Duration duration=Duration.zero;
  Duration position=Duration.zero;
  var i=null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) { 

      setState(() {
         isPlaying = state==PlayerState.playing;
      });
       
      
    });

    audioPlayer.onPositionChanged.listen((pos) {

      setState(() {
        position=pos;
      });
        
    });

    audioPlayer.onDurationChanged.listen((dur) {
      setState(() {
        duration=dur;
      });
     });


  }


  Future setAudio() async {

      await audioPlayer.play(AssetSource(Songs[i??0]["path"]));

  }


  
  @override
  Widget build(BuildContext context) {
    final routes=ModalRoute.of(context)?.settings.arguments as Map<String,int>;

     i=routes['index']?.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        
      ),
      body: Container(
        color: Colors.grey,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.all(20),
              child: Image.network(Songs[i??0]["thumbnail"])
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(), 
                onChanged: (value) async {

                    print(value);

                  await audioPlayer.seek(Duration(microseconds: (value * 1000).toInt()));
                }
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () async {
                      if(isPlaying==false)
                      {
                        await audioPlayer.resume();
                      }
                      else 
                      {
                        await audioPlayer.pause();
                      }
                    }, 
                    icon: isPlaying==false?Icon(Icons.play_arrow):Icon(Icons.pause),
                ))
          ],
        ),
      ),
    );
  }
}