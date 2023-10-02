import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/TaskList.dart';
import '../widgets/DateSelector.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final now = DateTime.now();
  final String day = getDayOfTheWeek(DateTime.now().weekday);
  String getEmoji(DateTime now) {
    if (now.hour >= 5 && now.hour < 12) {
      return 'Morning 🌞'; // Morning emoji
    } else if (now.hour >= 12 && now.hour < 17) {
      return 'Afternoon ☀️'; // Afternoon emoji
    } else if (now.hour >= 17 && now.hour < 20) {
      return 'Evening 🌇'; // Evening emoji
    } else {
      return 'Night 🌙'; // Night emoji
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String emoji = getEmoji(now);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        // Customie the color as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Handle the action for the first button on the left
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Handle the action for the second button on the left
                  },
                ),
              ],
            ),
            Container(
              color: Colors.amber,
              child: IconButton(
                color: Color(0xFF00A86B),
                icon: Icon(Icons.add),
                onPressed: () {
                  // Handle the action for the button on the right
                },
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Good $emoji',
                          style: TextStyle(
                              fontFamily: 'PlusJakartaSans', fontSize: 25)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      weight: 3,
                      color: Color(0xFF7E8491),
                    ),
                  ),
                ],
              ),
              DateSelector(),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Today - ',
                        style: TextStyle(
                            fontFamily: "PlusJakartaSansMedium", fontSize: 18),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "${day}",
                        style: TextStyle(
                            fontFamily: "PlusJakartaSansLight", fontSize: 18),
                      ),
                    ],
                  )

                  //Fetch
                  ,
                  SizedBox(
                    height: 15,
                  ),
                  TaskLists()
                  // TaskLists()
                ]),
              )
            ],

            //Date Selector
          ),
        ),
      ),
    );
  }

  static getDayOfTheWeek(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'SUnday';
      default:
        return '';
    }
  }
}
