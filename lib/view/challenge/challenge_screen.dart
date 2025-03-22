import 'package:fitnessapp/utils/app_colors.dart';
import 'package:fitnessapp/view/activity/widgets/upcoming_workout_row.dart';
import 'package:fitnessapp/view/activity/widgets/what_train_row.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/round_button.dart';
import '../workour_detail_view/workour_detail_view.dart';
import 'live_challenge.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);
  static String routeName = "/ChallengeScreen";

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {

  List latestArr = [
    {
      "image": "assets/images/Workout1.png",
      "title": "Walk 10000 Steps",
      "time": "50 Points"
    },
    {
      "image": "assets/images/Workout2.png",
      "title": "100 Pushups",
      "time": "75 Points"
    },
    {
      "image": "assets/images/Workout3.png",
      "title": "15 Pullups",
      "time": "150 Points"
    }
  ];

  List whatArr = [
    {
      "image": "assets/images/what_1.png",
      "title": "Fullbody Workout",
      "exercises": "11 Exercises",
      "time": "32mins"
    },
    {
      "image": "assets/images/what_2.png",
      "title": "Lowebody Workout",
      "exercises": "12 Exercises",
      "time": "40mins"
    },
    {
      "image": "assets/images/what_3.png",
      "title": "AB Workout",
      "exercises": "14 Exercises",
      "time": "20mins"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
      BoxDecoration(gradient: LinearGradient(colors: AppColors.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              // pinned: true,
              title: const Text(
                "Weekly Challenges",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrayColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "assets/icons/more_icon.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ];
        },
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const TopThreeLeaderboard(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                          color: AppColors.grayColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor2.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Challenge a Friend",
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 70,
                            height: 25,
                            child: RoundButton(
                              title: "Invite",
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
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Live Challenges",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See More",
                            style: TextStyle(
                                color: AppColors.grayColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: latestArr.length,
                        itemBuilder: (context, index) {
                          var wObj = latestArr[index] as Map? ?? {};
                          return LiveChallenge(wObj: wObj);
                        }),
                    SizedBox(
                      height: media.width * 0.01,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class TopThreeLeaderboard extends StatelessWidget {
  const TopThreeLeaderboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> topThreeUsers = [
      {'name': 'Bob', 'profilePic': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn0x1htT8a8m5hOa7QTbMgDkgCRxjmHNQaWg&s', 'points' : '450'}, // 2nd place (Left)
      {'name': 'Alice', 'profilePic': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4xcnTzEA3Fv59eq5rqNrxXZ2BdlzX468I5w&s', 'points' : '800'}, // 1st place (Middle)
      {'name': 'Charlie', 'profilePic': 'https://thumbs.dreamstime.com/b/fashion-beautiful-woman-profile-portrait-sunglasses-close-u-up-55723892.jpg', 'points' : '420'}, // 3rd place (Right)
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "🏆 Top 3 Leaderboard",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Second place (Left)
              buildLeaderboardUser(topThreeUsers[0], 50, 14),

              // First place (Middle - Largest)
              buildLeaderboardUser(topThreeUsers[1], 65, 16, isFirst: true),

              // Third place (Right)
              buildLeaderboardUser(topThreeUsers[2], 50, 14),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLeaderboardUser(Map<String, String> user, double avatarSize, double fontSize, {bool isFirst = false}) {
    return Column(
      children: [
        Text(
          isFirst ? "🥇" : (avatarSize == 50 ? "🥈" : "🥉"),
          style: const TextStyle(fontSize: 20),
        ),
        CircleAvatar(
          radius: avatarSize / 2,
          backgroundImage: NetworkImage(user['profilePic']!),
        ),
        const SizedBox(height: 5),
        Text(
          user['name']!,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: AppColors.blackColor,
          ),
        ),
        Text(
          user['points']!,
          style: TextStyle(
            fontSize: fontSize - 2,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
