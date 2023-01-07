import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Answers extends StatelessWidget {
  final VoidCallback selectedItem;
  final String answerText;
  final int totalScore;
  final int questionsIndex;

  void cheakScore() {
    final player = AudioPlayer();
    if (totalScore < 6) {
      player.play(AssetSource("media/5.mp3"));
    } else if (totalScore >= 6 && totalScore < 9) {
      player.play(AssetSource("media/6.mp3"));
    } else if (totalScore >= 9 && totalScore < 11) {
      player.play(AssetSource("media/9.mp3"));
    } else {
      player.play(AssetSource("media/12.mp3"));
    }
  }

  const Answers(
      this.selectedItem, this.answerText, this.questionsIndex, this.totalScore,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
          onPressed: () => {
                selectedItem(),
                if (questionsIndex == 11) {cheakScore()}
              },
          child: Text(answerText)),
    );
  }
}
