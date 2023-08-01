import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:chatbot_app/screens/user/DietPlan.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NewDietPlanScreen extends StatefulWidget {
  const NewDietPlanScreen({Key? key}) : super(key: key);

  @override
  State<NewDietPlanScreen> createState() => _NewDietPlanScreenState();
}

class _NewDietPlanScreenState extends State<NewDietPlanScreen> {
  bool timezone = false;

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
  final kFirstDay = DateTime(DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
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

  @override
  void initState() {
    final DateTime today = DateTime.now();
    startDate = DateFormat('yyyy-MM-dd').format(today).toString();
    endDate = DateFormat('yyyy-MM-dd').format(today.add(Duration(days: 3))).toString();
    _controller.selectedRange = PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      startDate = DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      endDate = DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate).toString();
    });
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
          "Diet Plan",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        // Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0), height: 50, child: Text('StartRangeDate:' '$_startDate')),
        // Container(height: 50, child: Text('EndRangeDate:' '$_endDate')),
        Card(
          margin: const EdgeInsets.fromLTRB(50, 40, 50, 100),
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
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            var firstDate = DateTime.parse(startDate);
            var day = firstDate.day;
            var month = firstDate.month;
            var year = firstDate.year;

            var secondDate = DateTime.parse(endDate);

            var count = secondDate.difference(firstDate).inDays+1;

            List<bool> boolList = createBooleanList(count);

            print(startDate);

            //print(count);
            notifire = 'doClear';

            if (notifire == 'doClear') {
              dietEntries = [];
              Get.to(() => DietPlanDays(
                    count: count,
                    day: day,
                    month: month,
                    year: year,
                    boolList: boolList,
                    tag: false,
                  ));
            } else {
              Get.to(() => DietPlanDays(
                    count: count,
                    day: day,
                    month: month,
                    year: year,
                    boolList: boolList,
                    tag: false,
                  ));
            }

            // Get.toNamed("/NutritiontrackingMealScreen");
            // Get.to(() => NutritionTrackingScreen());
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
      ]),

      // how to get the count between two dates

      // Container(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 23.w),
      //     child: SingleChildScrollView(
      //       child: Column(children: [
      //         Container(
      //           padding: EdgeInsets.only(left: 20.r, right: 20.r, bottom: 20.r),
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r), border: Border.all(width: 1, color: Color(0xffD2D2D2)), color: Colors.white),
      //           child: TableCalendar(
      //             weekNumbersVisible: false,
      //             rowHeight: 50.h,

      //             firstDay: DateTime.now(),
      //             lastDay: DateTime.utc(2030, 3, 14),
      //             focusedDay: focusedDay,
      //             rangeSelectionMode: RangeSelectionMode.enforced,
      //             onDaySelected: (DateTime selectDay, DateTime focusDay) {
      //               setState(() {
      //                 selectedDay = selectDay;
      //                 focusedDay = focusDay;
      //               });

      //               // //print(DateFormat.yMMMMd().format(selectedDay));
      //               //print(selectedDay);
      //             },
      //             selectedDayPredicate: (DateTime date) {
      //               return isSameDay(selectedDay, date);
      //             },

      //             // calendarFormat: format,
      //             headerStyle: HeaderStyle(
      //                 leftChevronIcon: Container(
      //                     padding: EdgeInsets.all(10.sp),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       gradient: kprimary,
      //                     ),
      //                     child: Icon(
      //                       Icons.arrow_back_ios,
      //                       color: Colors.white,
      //                       size: 13.r,
      //                     )),
      //                 rightChevronIcon: Container(
      //                     padding: EdgeInsets.all(10.sp),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       gradient: kprimary,
      //                     ),
      //                     child: Icon(
      //                       Icons.arrow_forward_ios,
      //                       color: Colors.white,
      //                       size: 13.r,
      //                     )),
      //                 formatButtonVisible: false,
      //                 titleTextFormatter: (date, locale) => DateFormat.MMMM(locale).format(date),
      //                 titleCentered: true,
      //                 titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp)),
      //             calendarBuilders: CalendarBuilders(
      //               dowBuilder: (context, day) {
      //                 if (day.weekday == DateTime.sunday || day.weekday == DateTime.saturday) {
      //                   // final text = S;

      //                   return Center(
      //                     child: Text(
      //                       'S',
      //                       // style: TextStyle(color: Colors.red),
      //                     ),
      //                   );
      //                 }
      //                 if (day.weekday == DateTime.tuesday) {
      //                   // final text = S;

      //                   return Center(
      //                     child: Text(
      //                       'T',
      //                       // style: TextStyle(color: Colors.red),
      //                     ),
      //                   );
      //                 }
      //                 if (day.weekday == DateTime.thursday) {
      //                   // final text = S;

      //                   return Center(
      //                     child: Text(
      //                       'Q',
      //                       // style: TextStyle(color: Colors.red),
      //                     ),
      //                   );
      //                 }
      //                 if (day.weekday == DateTime.monday) {
      //                   // final text = S;

      //                   return Center(
      //                     child: Text(
      //                       'M',
      //                       // style: TextStyle(color: Colors.red),
      //                     ),
      //                   );
      //                 }
      //                 if (day.weekday == DateTime.wednesday) {
      //                   // final text = S;

      //                   return Center(
      //                     child: Text(
      //                       'Q',
      //                       // style: TextStyle(color: Colors.red),
      //                     ),
      //                   );
      //                 }
      //                 if (day.weekday == DateTime.friday) {
      //                   // final text = S;

      //                   return Center(
      //                     child: Text(
      //                       'S',
      //                       // style: TextStyle(color: Colors.red),
      //                     ),
      //                   );
      //                 }
      //               },
      //             ),
      //             calendarStyle: CalendarStyle(
      //                 isTodayHighlighted: false,
      //                 rowDecoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r), color: Color(0xffF3F3F3)),
      //                 disabledDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      //                 disabledTextStyle: TextStyle(color: Colors.black),
      //                 todayTextStyle: TextStyle(color: Colors.black),
      //                 withinRangeDecoration: BoxDecoration(shape: BoxShape.circle, gradient: kprimary),
      //                 todayDecoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black), shape: BoxShape.circle),
      //                 selectedTextStyle: TextStyle(color: Colors.white),
      //                 selectedDecoration: BoxDecoration(shape: BoxShape.circle, gradient: kprimary)),
      //             onPageChanged: (focusedDay) {},
      //           ),
      //         ),
      //         SizedBox(height: 20.h),
      //         GestureDetector(
      //           onTap: () {
      //             Get.toNamed("/NutritiontrackingMealScreen");
      //           },
      //           child: Container(
      //             width: 356.w,
      //             height: 56.h,
      //             decoration: BoxDecoration(
      //               gradient: kprimary,
      //               borderRadius: BorderRadius.circular(50.r),
      //             ),
      //             child: Center(
      //               child: Text(
      //                 "Continue",
      //                 style: TextStyle(color: Colors.white, fontSize: 20.sp),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
    );
  }
}
