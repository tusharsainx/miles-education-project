import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MEReelsPage extends StatelessWidget {
  final YoutubePlayerController ycontroller;
  final bool showFullPage;
  const MEReelsPage(
      {super.key, required this.ycontroller, this.showFullPage = true});
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: ycontroller,
      ),
      builder: (context, player) {
        return showFullPage
            ? SizedBox.expand(
                child: Expanded(child: player),
              )
            : player;
      },
    );
  }
}
