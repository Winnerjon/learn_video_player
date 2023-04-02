import 'package:flutter/material.dart';
import 'package:learn_video_play/screens/home/widget/home_card.dart';

import '../../models/home_model.dart';
import '../../services/test_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Video> videos = [];
  bool isLoading = false;

  @override
  void initState() {
    getVideos();
    super.initState();
  }

  getVideos() async {
    isLoading = true;
    setState(() {});
    HomeModel homeModel = HomeModel.fromJson(TestService.mediaJSON);
    videos = homeModel.categories.first.videos;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video player"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast_connected_outlined,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return HomeCard(video: videos[index]);
        },
      ),
    );
  }
}
