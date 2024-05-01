import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  // Dummy timetable data (replace it with your actual data)
  final List<List<String>> timetableData = [
    ['7:45-8:30', 'Math', 'Science', 'English', 'Maths', 'History', 'Science'],
    ['8:35-9:19', 'English', 'History', 'Math', 'English', 'Science', 'Math'],
    ['9:24-9:31', 'Break', 'Break', 'Break', 'Break', 'Break', 'Break'],
    ['9:36-10:20', 'History', 'English', 'Science', 'History', 'Math', 'English'],
    ['10:25-11:09', 'Math', 'Science', 'English', 'Science', 'History', 'History'],
    ['11:14-11:58', 'Math', 'Science', 'English', 'English', 'History', 'Maths'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.sp),
                child: Text("TimeTable",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
              ),
              Center(
                child: Table(
                  border: TableBorder.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  columnWidths: {
                    0: FixedColumnWidth(45.sp), // Time column width
                    1: FixedColumnWidth(42.sp), // Day columns width
                    2: FixedColumnWidth(42.sp),
                    3: FixedColumnWidth(42.sp),
                    4: FixedColumnWidth(42.sp),
                    5: FixedColumnWidth(42.sp),
                    6: FixedColumnWidth(42.sp),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text(
                              'Time',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              'Monday',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              'Tuesday',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              'Wednesday',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              'Thursday',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              'Friday',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              'Saturday',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    for (var row in timetableData)
                      TableRow(
                        children: row
                            .map(
                              (item) => TableCell(
                            child: Center(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
