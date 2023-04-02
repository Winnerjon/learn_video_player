import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  const VideoScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: videoPlayerController.value.aspectRatio,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      zoomAndPan: true,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.white.withOpacity(0.5),
        bufferedColor: Colors.grey.shade400,
        playedColor: Colors.red,
        handleColor: Colors.red,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Chewie(controller: _chewieController),
      ),
    );
  }
}
