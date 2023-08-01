import 'dart:async';
import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/screens/myroutine.dart';
import 'package:chatbot_app/screens/user/Routine.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

import '../controllers/RoutineController.dart';

class Routine17Screen extends StatefulWidget {
  const Routine17Screen({Key? key}) : super(key: key);

  @override
  State<Routine17Screen> createState() => _Routine17ScreenState();
}

class _Routine17ScreenState extends State<Routine17Screen> {
  List<DateTime> _selectedDates = [];

  RotineController _routineController = Get.put(RotineController());

  // Callback function to track selected dates

  bool timezone = false;
  bool timezone2 = false;

  String main_starttime = "";
  String main_endtime = "";

  String? selectedValuemT1;
  String? selectedValuemT2;
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
  );
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
  // .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final kToday = DateTime.now();
  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
  double pad = 23.0;

  final DateRangePickerController _controller = DateRangePickerController();
  List<bool> boolList = [];
  List<bool> createBooleanList(int counter) {
    boolList.clear();
    for (int i = 0; i < counter; i++) {
      boolList.add(false);
    }
    return boolList;
  }

  var startDate;
  var endDate;

  @override
  void initState() {
  getRoutine();
    final DateTime today = DateTime.now();
    startDate = DateFormat('yyyy-MM-dd').format(today).toString();
    endDate = DateFormat('yyyy-MM-dd')
        .format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }



  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      startDate =
          DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      endDate = DateFormat('yyyy-MM-dd')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
    log(startDate);
    log(endDate);
  }


    getRoutine() async {
  var btn =  await ApiService().getRoutineApi(context);
    // //print(bt.RoutineData);

  }

  @override
  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: res_width * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Routine",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SfCalendar(
                //   cellEndPadding: 1,
                //   view: CalendarView.month,
                //   // allowedViews: [
                //   //   CalendarView.month,
                //   // ],
                //   headerStyle: CalendarHeaderStyle(textAlign: TextAlign.center),
                //   allowViewNavigation: true,
                //   cellBorderColor: Colors.transparent,
                //   headerDateFormat: "MMMM",
                //   monthViewSettings: MonthViewSettings(
                //     navigationDirection: MonthNavigationDirection.horizontal,
                //     showTrailingAndLeadingDates: false,
                //     monthCellStyle: MonthCellStyle(),
                //   ),
                // ),
                // SizedBox(height: 20.h),
                // ScrollableCleanCalendar(
                //   calendarController: calendarController,
                //   layout: Layout.BEAUTY,
                //   calendarCrossAxisSpacing: 0,
                // ),
                Card(
                  margin: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                  child: SfDateRangePicker(
                      minDate: DateTime.now(),
                    rangeSelectionColor: Colors.orange,
                    endRangeSelectionColor: Color(0xffFD6939),
                    startRangeSelectionColor: Color(0xffFD6939),
                    controller: _controller,
                    selectionMode: DateRangePickerSelectionMode.range,
                    onSelectionChanged: selectionChanged,
                    allowViewNavigation: false,
                  ),
                ),

                // Row(
                //   children: [
                //     Text(
                //       "Start Time",
                //       style: TextStyle(
                //         fontSize: 20.sp,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 53.h,
                //       width: 165.w,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50.r),
                //         border: Border.all(color: Colors.grey),
                //       ),
                //       child: DropdownButtonFormField2(
                //         // dropdownWidth: 315.w,
                //         dropdownDecoration: BoxDecoration(
                //           color: Colors.white,
                //           shape: BoxShape.rectangle,
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         buttonPadding: EdgeInsets.symmetric(
                //           horizontal: 20.w,
                //         ),
                //         icon: Icon(
                //           Icons.arrow_drop_down_circle,
                //           size: 24.h,
                //         ),
                //         decoration: InputDecoration(
                //           isDense: true,
                //           // alignLabelWithHint: true,
                //           // contentPadding:
                //           //     EdgeInsets.symmetric(
                //           //         horizontal: 20.w),
                //           disabledBorder: InputBorder.none,
                //           enabledBorder: InputBorder.none,
                //         ),
                //         isExpanded: true,
                //         iconEnabledColor: Colors.black,
                //         buttonWidth: 165.w,
                //         buttonHeight: 53.h,
                //         hint: Text(
                //           '04:00',
                //           style:
                //               TextStyle(color: Colors.black, fontSize: 15.sp),
                //         ),
                //         value: selectedValuemT1,
                //         onChanged: (value) {
                //           setState(
                //             () {
                //               selectedValuemT1 = value as String?;
                //             },
                //           );
                //         },
                //         items: time
                //             .map(
                //               (item) => DropdownMenuItem<String>(
                //                 value: item,
                //                 child: Text(
                //                   item,
                //                   style: TextStyle(
                //                       fontSize: 15.sp, color: Colors.grey),
                //                 ),
                //               ),
                //             )
                //             .toList(),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 20.w),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: <Widget>[
                //           Container(
                //             height: 53.h,
                //             width: 176.w,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50.r),
                //               border: Border.all(color: Colors.grey),
                //             ),
                //             child: Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 22.w),
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: <Widget>[
                //                   GestureDetector(
                //                     onTap: () {
                //                       setState(() {
                //                         timezone = true;
                //                       });
                //                     },
                //                     child: Container(
                //                       width: 54.w,
                //                       height: 34.h,
                //                       decoration: BoxDecoration(
                //                         color: timezone
                //                             ? Color(0xffFD6839)
                //                             : Colors.white,
                //                         borderRadius: BorderRadius.circular(
                //                           17.r,
                //                         ),
                //                       ),
                //                       child: Center(
                //                         child: Text(
                //                           "AM",
                //                           style: TextStyle(
                //                             fontSize: 15.sp,
                //                             fontWeight: FontWeight.w500,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   GestureDetector(
                //                     onTap: () {
                //                       setState(() {
                //                         timezone = false;
                //                       });
                //                     },
                //                     child: Container(
                //                       width: 54.w,
                //                       height: 34.h,
                //                       decoration: BoxDecoration(
                //                         color: timezone
                //                             ? Colors.white
                //                             : Color(0xffFD6839),
                //                         borderRadius: BorderRadius.circular(
                //                           17.r,
                //                         ),
                //                       ),
                //                       child: Center(
                //                         child: Text(
                //                           "PM",
                //                           style: TextStyle(
                //                             fontSize: 15.sp,
                //                             fontWeight: FontWeight.w500,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),

                // Row(
                //   children: [
                //     Text(
                //       "Start Time",
                //       style: TextStyle(
                //         fontSize: 20.sp,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10.h,
                ),
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 53.h,
                //       width: 165.w,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50.r),
                //         border: Border.all(color: Colors.grey),
                //       ),
                //       child: DropdownButtonFormField2(
                //         // dropdownWidth: 315.w,
                //         dropdownDecoration: BoxDecoration(
                //           color: Colors.white,
                //           shape: BoxShape.rectangle,
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         buttonPadding: EdgeInsets.symmetric(
                //           horizontal: 20.w,
                //         ),
                //         icon: Icon(
                //           Icons.arrow_drop_down_circle,
                //           size: 24.h,
                //         ),
                //         decoration: InputDecoration(
                //           isDense: true,
                //           // alignLabelWithHint: true,
                //           // contentPadding:
                //           //     EdgeInsets.symmetric(
                //           //         horizontal: 20.w),
                //           disabledBorder: InputBorder.none,
                //           enabledBorder: InputBorder.none,
                //         ),
                //         isExpanded: true,
                //         iconEnabledColor: Colors.black,
                //         buttonWidth: 165.w,
                //         buttonHeight: 53.h,
                //         hint: Text(
                //           '04:00',
                //           style:
                //               TextStyle(color: Colors.black, fontSize: 15.sp),
                //         ),
                //         value: selectedValuemT2,
                //         onChanged: (value) {
                //           setState(
                //             () {
                //               selectedValuemT2 = value as String?;
                //             },
                //           );
                //         },
                //         items: time2
                //             .map(
                //               (item) => DropdownMenuItem<String>(
                //                 value: item,
                //                 child: Text(
                //                   item,
                //                   style: TextStyle(
                //                       fontSize: 15.sp, color: Colors.grey),
                //                 ),
                //               ),
                //             )
                //             .toList(),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 20.w),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: <Widget>[
                //           Container(
                //             height: 53.h,
                //             width: 176.w,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50.r),
                //               border: Border.all(color: Colors.grey),
                //             ),
                //             child: Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 22.w),
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: <Widget>[
                //                   GestureDetector(
                //                     onTap: () {
                //                       setState(() {
                //                         timezone2 = true;
                //                       });
                //                     },
                //                     child: Container(
                //                       width: 54.w,
                //                       height: 34.h,
                //                       decoration: BoxDecoration(
                //                         color: timezone2
                //                             ? Color(0xffFD6839)
                //                             : Colors.white,
                //                         borderRadius: BorderRadius.circular(
                //                           17.r,
                //                         ),
                //                       ),
                //                       child: Center(
                //                         child: Text(
                //                           "AM",
                //                           style: TextStyle(
                //                             fontSize: 15.sp,
                //                             fontWeight: FontWeight.w500,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   GestureDetector(
                //                     onTap: () {
                //                       setState(() {
                //                         timezone2 = false;
                //                       });
                //                     },
                //                     child: Container(
                //                       width: 54.w,
                //                       height: 34.h,
                //                       decoration: BoxDecoration(
                //                         color: timezone2
                //                             ? Colors.white
                //                             : Color(0xffFD6839),
                //                         borderRadius: BorderRadius.circular(
                //                           17.r,
                //                         ),
                //                       ),
                //                       child: Center(
                //                         child: Text(
                //                           "PM",
                //                           style: TextStyle(
                //                             fontSize: 15.sp,
                //                             fontWeight: FontWeight.w500,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Start Time",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      picker.DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onChanged: (date) {
                        ////print('change $date in time zone ' +
                        // date.timeZoneOffset.inHours.toString());//
                      }, onConfirm: (date) {
                        var checkzone =
                            int.parse(date.toString().substring(11, 13));
                        if (checkzone > 12) {
                          var hours = date.hour - 12;
                          main_starttime =
                              '${hours}${date.toString().substring(13, 16)} PM';
                          setState(() {});
                        } else {
                          main_starttime =
                              '${date.toString().substring(11, 16)} AM';
                          setState(() {});
                        }
                        // //print(main_starttime);
                      }, currentTime: DateTime.now());
                    },
                    child: Container(
                      height: 53.h,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              main_starttime == ""
                                  ? 'Click & Select Start Time'
                                  : main_starttime,
                              style: TextStyle(color: bprimary),
                            ),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              size: 24.h,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "End Time",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      picker.DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onChanged: (date) {
                        ////print('change $date in time zone ' +
                        // date.timeZoneOffset.inHours.toString());//
                      }, onConfirm: (date) {
                        var checkzone =
                            int.parse(date.toString().substring(11, 13));
                        if (checkzone > 12) {
                          var hours = date.hour - 12;
                          main_endtime =
                              '${hours}${date.toString().substring(13, 16)} PM';
                          setState(() {});
                        } else {
                          main_endtime =
                              '${date.toString().substring(11, 16)} AM';
                          setState(() {});
                        }
                        // //print(main_starttime);
                      }, currentTime: DateTime.now());
                    },
                    child: Container(
                      height: 53.h,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              main_endtime == ""
                                  ? 'Click & Select End Time'
                                  : main_endtime,
                              style: TextStyle(color: bprimary),
                            ),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              size: 24.h,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )),

                GestureDetector(
                  onTap: () async {
                    // Get.toNamed("/Routine1Screen");
                    var firstDate = DateTime.parse(startDate);
                    var day = firstDate.day;
                    var month = firstDate.month;
                    var year = firstDate.year;

                    var secondDate = DateTime.parse(endDate);

                    var count = secondDate.difference(firstDate).inDays + 1;

                    List<bool> boolList = createBooleanList(count);

                    // //print(count);
                    // //print(main_starttime);
                    // //print(main_endtime);
                    // //print(boolList);

                    if (count <= 1) {
                      Get.snackbar('Error', "Select More Then one Day",
                          snackPosition: SnackPosition.TOP,
                          duration: Duration(seconds: 3),
                          backgroundColor: Color.fromARGB(255, 222, 219, 219),
                          colorText: Colors.black);
                    } else if (main_starttime == "") {
                      Get.snackbar('Error', "Select Start Time",
                          snackPosition: SnackPosition.TOP,
                          duration: Duration(seconds: 3),
                          backgroundColor: Color.fromARGB(255, 222, 219, 219),
                          colorText: Colors.black);
                    } else if (main_endtime == "") {
                      Get.snackbar('Error', "Select End Time",
                          snackPosition: SnackPosition.TOP,
                          duration: Duration(seconds: 3),
                          backgroundColor: Color.fromARGB(255, 222, 219, 219),
                          colorText: Colors.black);
                    } else {
                      await _routineController.StoreRoutineDetails(
                          startDate, endDate, main_starttime, main_endtime);
                      // //print(_routineController.mainRoutine);
                      Get.to(() => RoutineScreen(
                            count: count,
                            day: day,
                            month: month,
                            year: year,
                            boolList: boolList,
                            tag: false,
                          ));
                    }
                  },
                  child: Container(
                    width: 356.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      gradient: kprimary,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
