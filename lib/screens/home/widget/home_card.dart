import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../models/home_model.dart';
import '../../video/video_screen.dart';

class HomeCard extends StatefulWidget {
  final Video video;

  const HomeCard({Key? key, required this.video}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => VideoScreen(
                    videoUrl: widget.video.sources.first,
                  ),
                ),
              );
            },
            child: CachedNetworkImage(
              height: 200,
              width: double.infinity,
              imageUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/${widget.video.thumb}",
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(value: downloadProgress.progress),
                  ),
                );
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, image) {
                return Container(
                  alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: image,
                      ),
                    ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.play_arrow, color: Colors.white54, size: 35,),
                  ),
                );
              },
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 15, bottom: 5),
          title: Text(
            widget.video.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: ReadMoreText(
            widget.video.description,
            trimLines: 1,
            colorClickableText: Colors.blue,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
                color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w400),
            lessStyle: const TextStyle(
                color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
