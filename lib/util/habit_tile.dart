import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;

  const HabitTile({Key? key, required this.habitName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              // progress circle
              // CircularPercentIndicator(
              //   radius: 40,
              // ),
              Container(
                height: 60,
                width: 60,
                // color: Colors.orange,
                child: Stack(children: [
                  // progress circle
                  CircularPercentIndicator(
                    radius: 60,
                  ),
                  // plat pause button
                  Center(child: Icon(Icons.play_arrow)),
                ]),
              ),
              const SizedBox(width: 15),
              // name and percentage
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // habit name
                  Text(
                    habitName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  // progress
                  const Text(
                    "2:00 / 10 = 20%",
                    // style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.settings),
        ]),
      ),
    );
  }
}
