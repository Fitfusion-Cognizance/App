import 'package:fitnessapp/utils/app_colors.dart';
import 'package:fitnessapp/view/activity_tracker/widgets/latest_activity_row.dart';
import 'package:fitnessapp/view/activity_tracker/widgets/today_target_cell.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityTrackerScreen extends StatefulWidget {
  static String routeName = "/ActivityTrackerScreen";
  const ActivityTrackerScreen({Key? key}) : super(key: key);

  @override
  State<ActivityTrackerScreen> createState() => _ActivityTrackerScreenState();
}

class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
  int touchedIndex = -1;

  List latestArr = [
    {
      "image": "assets/images/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/images/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.lightGrayColor,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/icons/back_icon.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Text(
          "Activity Tracker",
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                height: media.width * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 3)
                    ]),
                // child: BarChart(
                //   BarChartData(
                //     barTouchData: BarTouchData(
                //       touchTooltipData: BarTouchTooltipData(
                //         tooltipMargin: 10,
                //         getTooltipItem: (group, groupIndex, rod, rodIndex) {
                //           String weekDay = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][group.x];
                //           return BarTooltipItem(
                //             '$weekDay\n',
                //             const TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 14,
                //             ),
                //             children: <TextSpan>[
                //               TextSpan(
                //                 text: rod.toY.toString(),
                //                 style: const TextStyle(
                //                   color: AppColors.whiteColor,
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ],
                //           );
                //         },
                //       ),
                //       touchCallback: (FlTouchEvent event, barTouchResponse) {
                //         setState(() {
                //           if (!event.isInterestedForInteractions || barTouchResponse?.spot == null) {
                //             touchedIndex = -1;
                //             return;
                //           }
                //           touchedIndex = barTouchResponse!.spot!.touchedBarGroupIndex;
                //         });
                //       },
                //     ),
                //     titlesData: FlTitlesData(
                //       show: true,
                //       rightTitles: AxisTitles(
                //         sideTitles: SideTitles(showTitles: false),
                //       ),
                //       topTitles: AxisTitles(
                //         sideTitles: SideTitles(showTitles: false),
                //       ),
                //       bottomTitles: AxisTitles(
                //         sideTitles: SideTitles(
                //           showTitles: true,
                //           getTitlesWidget: getTitles,
                //           reservedSize: 38,
                //         ),
                //       ),
                //       leftTitles: AxisTitles(
                //         sideTitles: SideTitles(
                //           showTitles: false,
                //         ),
                //       ),
                //     ),
                //     borderData: FlBorderData(
                //       show: false,
                //     ),
                //     barGroups: showingGroups(),
                //     gridData: FlGridData(show: false),
                //   ),
                // ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget getTitles(double value, TitleMeta meta) {
  //   var style = const TextStyle(
  //     color: AppColors.grayColor,
  //     fontWeight: FontWeight.w500,
  //     fontSize: 12,
  //   );
  //   Widget text;
  //   switch (value.toInt()) {
  //     case 0:
  //       text = Text('Sun', style: style);
  //       break;
  //     case 1:
  //       text = Text('Mon', style: style);
  //       break;
  //     case 2:
  //       text = Text('Tue', style: style);
  //       break;
  //     case 3:
  //       text = Text('Wed', style: style);
  //       break;
  //     case 4:
  //       text = Text('Thu', style: style);
  //       break;
  //     case 5:
  //       text = Text('Fri', style: style);
  //       break;
  //     case 6:
  //       text = Text('Sat', style: style);
  //       break;
  //     default:
  //       text = Text('', style: style);
  //       break;
  //   }
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 8.0), // Adjust spacing if needed
  //     child: text,
  //   );
  // }

  // List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
  //   return makeGroupData(
  //     i,
  //     [5, 10.5, 5, 7.5, 15, 5.5, 8.5][i].toDouble(),
  //     AppColors.primaryG,
  //     isTouched: i == touchedIndex,
  //   );
  // });

  // BarChartGroupData makeGroupData(
  //     int x,
  //     double y,
  //     List<Color> barColor, {
  //       bool isTouched = false,
  //       double width = 22,
  //       List<int> showTooltips = const [],
  //     }) {
  //   return BarChartGroupData(
  //     x: x,
  //     barRods: [
  //       BarChartRodData(
  //         toY: isTouched ? y + 1 : y,
  //         gradient: LinearGradient(colors: barColor, begin: Alignment.topCenter, end: Alignment.bottomCenter),
  //         width: width,
  //         borderSide: isTouched
  //             ? const BorderSide(color: Colors.green)
  //             : const BorderSide(color: Colors.white, width: 0),
  //         backDrawRodData: BackgroundBarChartRodData(
  //           show: true,
  //           toY: 20,
  //           color: AppColors.lightGrayColor,
  //         ),
  //       ),
  //     ],
  //     showingTooltipIndicators: showTooltips,
  //   );
  // }
}
