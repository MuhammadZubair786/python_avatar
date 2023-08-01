import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NutritionTrackingScreen extends StatefulWidget {
  const NutritionTrackingScreen({Key? key}) : super(key: key);

  @override
  State<NutritionTrackingScreen> createState() =>
      _NutritionTrackingScreenState();
}

class _NutritionTrackingScreenState extends State<NutritionTrackingScreen> {
  bool timezone = false;
  bool timezone1 = false;
  final List<String> time = [
    'Chicken',
    'Carrots',
    'Rice Bowl',
  ];
  String? selectedValuemT1;
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
  );
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
  // .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  final kToday = DateTime.now();
  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
  double pad = 23.0;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
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
          "Nutritional Tracking",
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
                Container(
                  // width: 356.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.w),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Customer Name",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  // width: 356.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.w),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Customer Name",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.r),
                //     color: Colors.white,
                //     border: Border.all(color: Colors.grey),
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 20.w),
                //     child: SfDateRangePicker(
                //       monthCellStyle: DateRangePickerMonthCellStyle(),
                //       // monthFormat: "MMMM",
                //       headerStyle: DateRangePickerHeaderStyle(

                //         textAlign: TextAlign.center,
                //       ),
                //       onSelectionChanged: _onSelectionChanged,
                //       selectionMode: DateRangePickerSelectionMode.range,
                //       // rangeTextStyle: TextStyle(color: Colors.red),
                //       // selectionTextStyle: TextStyle(color: Colors.red),

                //       selectionColor: bprimary,
                //       rangeSelectionColor: Color(0xffF3F3F3),
                //       endRangeSelectionColor: bprimary,
                //       startRangeSelectionColor: bprimary,
                //       todayHighlightColor: bprimary,
                //       backgroundColor: Colors.white,
                //       // showTodayButton: false,

                //       initialSelectedRange: PickerDateRange(
                //           DateTime.now().subtract(const Duration(days: 4)),
                //           DateTime.now().add(const Duration(days: 3))),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 7.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/NutritiontrackingMealScreen");
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
