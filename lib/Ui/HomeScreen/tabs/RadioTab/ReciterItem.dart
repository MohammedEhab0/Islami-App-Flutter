import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';

import '../../../../model/reciters.dart';

class ReciterListWidget extends StatefulWidget {
  final List<Reciter> reciterList;

  const ReciterListWidget({super.key, required this.reciterList});

  @override
  State<ReciterListWidget> createState() => _ReciterListWidgetState();
}

class _ReciterListWidgetState extends State<ReciterListWidget> {
  final AudioPlayer player = AudioPlayer();
  int? playingIndex;
  bool isPlaying = false;
  Map<int, bool> volumeStates = {};

  /// Builds full URL (e.g., server/001.mp3)
  String? getReciterUrl(int index) {
    final baseUrl = widget.reciterList[index].moshaf?.first.server;
    if (baseUrl == null) return null;
    final surahIndex = (index + 1).toString().padLeft(3, '0');
    return baseUrl.endsWith('/')
        ? "$baseUrl$surahIndex.mp3"
        : "$baseUrl/$surahIndex.mp3";
  }

  void togglePlay(int index) async {
    final url = getReciterUrl(index);
    if (url == null) return;

    if (playingIndex == index && isPlaying) {
      await player.pause();
      setState(() => isPlaying = false);
    } else {
      await player.stop();
      try {
        await player.setSourceUrl(url);
        await player.resume();
        setState(() {
          playingIndex = index;
          isPlaying = true;
        });
      } catch (e) {
        debugPrint("Error playing URL: $url\n$e");
      }
    }
  }

  void toggleVolume(int index) async {
    final current = volumeStates[index] ?? true;
    await player.setVolume(current ? 0 : 1);
    setState(() => volumeStates[index] = !current);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: height * 0.008),
      itemCount: widget.reciterList.length,
      separatorBuilder: (context, index) => SizedBox(height: height * 0.019),
      itemBuilder: (context, index) {
        final reciter = widget.reciterList[index];
        final isCurrent = playingIndex == index && isPlaying;
        final isVolumeOpen = volumeStates[index] ?? true;

        return Container(
          padding: EdgeInsets.only(top: height * 0.01),
          width: width * 0.8,
          height: height * 0.18,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reciter.name ?? 'No Name',
                style: AppStyles.bold18black,
                overflow: TextOverflow.ellipsis,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppAssets.BotomShape, color: AppColors.Gray),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: width * 0.13),
                      IconButton(
                        icon: Icon(
                          isCurrent
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 44,
                          color: AppColors.White,
                        ),
                        onPressed: () => togglePlay(index),
                      ),
                      IconButton(
                        icon: Icon(
                          isVolumeOpen
                              ? Icons.volume_up_rounded
                              : Icons.volume_off_rounded,
                          size: 44,
                          color: AppColors.White,
                        ),
                        onPressed: () => toggleVolume(index),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
