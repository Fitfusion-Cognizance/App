import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fitnessapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/round_button.dart';

class LiveChallenge extends StatefulWidget {
  final Map wObj;
  const LiveChallenge({Key? key, required this.wObj}) : super(key: key);

  @override
  State<LiveChallenge> createState() => _LiveChallengeState();
}

class _LiveChallengeState extends State<LiveChallenge> {
  @override
  Widget build(BuildContext context) {
    bool positive = false;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.all( 10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                widget.wObj["image"].toString(),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.wObj["title"].toString(),
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.wObj["time"].toString(),
                      style: TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: 70,
              height: 25,
              child: RoundButton(
                title: "Start",
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         const ActivityTrackerView(),
                  //   ),
                  // );
                },
              ),
            )
          ],
        ));
  }
}
