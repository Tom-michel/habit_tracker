import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_tracker/util/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // overall habit sumary
  List habitList = [
    // [habitName, habitStarted, timeSpend (sec), timeGoal (min)]
    ["Exercise", false, 0, 1],
    ["Code", false, 5, 5],
    ["Read", false, 0, 2],
    ["Meditate", false, 0, 20],
  ];

  void habitStarter(int index) {
    // note what the start time is
    var startTime = DateTime.now();

    // include the time already alapsed
    int elapsedTime = habitList[index][2];

    // habit started or stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    // keep the time going
    if (habitList[index][1]) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        // setState(() {
        //   habitList[index][2]++;
        // });

        setState(() {
          // check when the user has stopped the timer
          if (!habitList[index][1]) {
            timer.cancel();
          }

          // calculate the time elapsed by comparing current time and start time
          var currentTime = DateTime.now();
          habitList[index][2] =
              elapsedTime + currentTime.difference(startTime).inSeconds;
          // = elapsedTime +
          //     currentTime.second -
          //     startTime.second +
          //     60 * (currentTime.minute - startTime.minute) +
          //     60 * 60 * (currentTime.hour - startTime.hour);

          // stop when is finish
          if (habitList[index][2] >= (habitList[index][3] * 60)) {
            habitList[index][2] = (habitList[index][3] * 60);
            habitList[index][1] = false;
            timer.cancel();
          }
        });
      });
    }
  }

  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Settings for " + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Consistency is key"),
        centerTitle: false,
      ),
      body: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: ((context, index) {
            return HabitTile(
              habitName: habitList[index][0],
              onTap: () {
                habitStarter(index);
              },
              settingsTapped: () {
                settingsOpened(index);
              },
              habitStarted: habitList[index][1],
              timeSpent: habitList[index][2],
              timeGoal: habitList[index][3],
            );
          })),
      // body: Column(children: [
      //   HabitTile(
      //     habitName: habitList[0][0],
      //     onTap: () {},
      //     settingsTapped: () {},
      //     habitStarted: habitList[0][1],
      //     timeSpent: habitList[0][2],
      //     timeGoal: habitList[0][3],
      //   ),
      // ]),
    );
  }
}
