//import 'dart:ffi';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  //VideoPlayer({Key? key, dynamic videoPlayerController}) : super(key: key);
  final VideoPlayerController videoPlayerController;
  final bool isLoop;
  VideoPlayer({required this.isLoop, required this.videoPlayerController});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late ChewieController chewieController;
  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.isLoop,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      showControls: true,
      showControlsOnInitialize: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    ));
  }
}

class VideoDisplay extends StatefulWidget {
  //VideoDisplay({Key? key}) : super(key: key);
  final String videoUrl;
  VideoDisplay({required this.videoUrl});
  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(
      isLoop: true,
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
    );
  }
}
