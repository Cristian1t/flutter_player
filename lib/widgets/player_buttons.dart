import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../models/models.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, snapshot) {
              return IconButton(
                  onPressed: audioPlayer.hasPrevious
                      ? audioPlayer.seekToPrevious
                      : null,
                  iconSize: 45.0,
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ));
            }),
        StreamBuilder(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = (playerState!).processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  width: 64.0,
                  height: 64.0,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if (!audioPlayer.playing) {
                return IconButton(
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                  iconSize: 75.0,
                  onPressed: audioPlayer.play,
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                  ),
                  iconSize: 75.0,
                  onPressed: audioPlayer.pause,
                );
              } else {
                return IconButton(
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 75.0,
                  onPressed: () =>
                      audioPlayer.seek(Duration.zero,
                          index: audioPlayer.effectiveIndices!.first),
                );
              }
              return const Text('data');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, snapshot) {
              return IconButton(
                // handle onPressed and set the title, description and coverUrl
                  onPressed: audioPlayer.hasNext
                      ? audioPlayer.seekToNext
                      : null,
                  iconSize: 45.0,
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ));
            }),
      ],
    );
  }

}
