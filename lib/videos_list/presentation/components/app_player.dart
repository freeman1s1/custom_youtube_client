import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppPlayer extends StatefulWidget {
  const AppPlayer({
    required this.url,
    Key? key,
  }) : super(key: key);

  final String url;

  @override
  State<AppPlayer> createState() => _AppPlayerState();
}

class _AppPlayerState extends State<AppPlayer> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: YoutubePlayer(
        controller: controller,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
        ),
      ),
    );
  }
}
