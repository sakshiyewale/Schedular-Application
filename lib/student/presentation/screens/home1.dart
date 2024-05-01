

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_application/student/bloc/homebloc/home_event.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/homebloc/home_bloc.dart';
import '../../bloc/homebloc/home_state.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  void initState() {
    BlocProvider.of<HomeDataBloc>(context).add(HomeDataFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Table Example'),
        ),
        body:Column(
          children: [
            BlocConsumer<HomeDataBloc, HomeState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case HomedataFailedFetchState:
                    final FailState = state as HomedataFailedFetchState;
                    return Center(
                      child: Text(FailState.fetcherror),
                    );
                  case HomeDataSuccessfulFetchState:
                    final successState = state as HomeDataSuccessfulFetchState;
                    print(successState);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: successState.student.length,
                        itemBuilder: (context, index) {
                         return  Table(
                           border: TableBorder.all(),
                           children: [
                             TableRow(
                               children: [
                                 TableCell(
                                   child: Center(child: Text('Time',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400),)),
                                 ),
                                 TableCell(
                                   child: Center(child: Text('Monday',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400))),
                                 ),
                                 TableCell(
                                   child: Center(child: Text('Tuesday',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400))),
                                 ),
                                 TableCell(
                                   child: Center(child: Text('Wednsday',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400))),
                                 ),
                                 TableCell(
                                   child: Center(child: Text('Thirsday',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400))),
                                 ),
                                 TableCell(
                                   child: Center(child: Text('Friday',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400))),
                                 ),
                                 TableCell(
                                   child: Center(child: Text('saturaday',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400))),
                                 ),
                               ],
                             ),

                             TableRow(
                               children: [
                                 TableCell(
                                   child: Center(child: Text(successState.student[index].username as String)),
                                 ),
                                 TableCell(
                                   child: Center(
                                     child: Text(
                                       '${successState.student[index].address.street},',
                                     ),
                                   ),
                                 ),

                                 TableCell(
                                   child: Center(
                                     child: Text(
                                       '${successState.student[index].address.city},',
                                     ),
                                   ),
                                 ),
                                 TableCell(
                                   child: Center(
                                     child: Text(
                                       '${successState.student[index].address.geo},',
                                     ),
                                   ),
                                 ),
                                 TableCell(
                                   child: Center(
                                     child: Text(
                                       '${successState.student[index].address.street},',
                                     ),
                                   ),
                                 ),
                                 TableCell(
                                   child: Center(
                                     child: Text(
                                       '${successState.student[index].address.city},',
                                     ),
                                   ),
                                 ),
                                 TableCell(
                                   child: Center(
                                     child: Text(
                                       '${successState.student[index].address.geo},',
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         );
                        },
                      ),
                    );
                  default:
                    return CircularProgressIndicator();
                }
              },
              listener: (BuildContext context, Object? state) {},
            ),
          ],
        )
      ),
    );
  }
}

