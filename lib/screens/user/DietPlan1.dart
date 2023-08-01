import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/constants/global.dart';
import 'package:chatbot_app/controllers/dietController.dart';
import 'package:intl/intl.dart';

import 'DietPlan.dart';

class DietPlan1Screen extends StatefulWidget {
  var dayName, tag, booList,ind;
  var count, startDate, day, month, year;
  DietPlan1Screen({this.dayName, this.count, this.startDate, this.day, this.tag, this.booList,this.ind, this.month, this.year, super.key});

  @override
  State<DietPlan1Screen> createState() => _DietPlan1ScreenState();
}

class _DietPlan1ScreenState extends State<DietPlan1Screen> {
  var addmoreCounter = 0;
  Map dietObjects = {};
  var mealEntries = [];
  String? selectedValue;
  String? selectedValue4;

  String? nonVegCategorySelectedValue;
  String? nonVegSelectedValue;

  String? cropCategorySelectedValue;
  String? cropSelectedValue;
  String? selectedValue3;

  List examples = [];
  List nonVegExamples = [];
  List cropExamples = [];

  int counter = 1;
  int counter2 = 1;
  int counter3 = 1;

  String formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());

  var selectedCat = [];
  List filteredCat = [];

  bool _isvisible = false;

  List vegData = [];
  List<String> nonVegData = [];
  var nonVegSelectedCat = [];
  var cropSelectedCat = [];
  int _index = 0;

  ApiService apiService = ApiService();

  DietController _dietController = Get.put(DietController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => getMealsData());
  }

  getMealsData() async {
    var res = await ApiService().getMealsApi(context);
    if (res['status'] != null) {
      _dietController.setNonVegData(res['data']['nonVeg']);
      _dietController.setVegData(res['data']['veg']);
      _dietController.setCropData(res['data']['crop']);

      _dietController.vegData;
    }
  }

  @override
  void dispose() {
    _dietController.mealData.clear();

    // _dietController.dispose();
    super.dispose();
  }

// get data from api and show in dropdown
  @override
  Widget build(BuildContext context) {
    //print(widget.count);
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
            width: Get.width * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Diet Plan ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Column(
              children: [
                Container(
                  height: 135.h,
                  width: 378.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                    border: Border.all(
                      color: Color(0xffD2D2D2),
                      width: 1.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Diet Plan",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Day ${widget.dayName}",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "${widget.year}-${widget.month}-${widget.day}",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          // how to show only time
                          formattedTime,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                // meal list view
                GetBuilder<DietController>(
                  builder: (mealC) => Column(
                    children: [
                      mealC.mealData.isEmpty
                          ? SizedBox()
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: mealC.mealData.length, //mealC.mealCount.value,
                              itemBuilder: (context, index) {
                                _index = index;

                                if (mealC.mealCount.value > 1) {
                                  _isvisible = true;
                                } else {
                                  _isvisible = false;
                                }

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Meal ${index + 1}",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Visibility(
                                          visible: _isvisible,
                                          child: IconButton(
                                              onPressed: () {
                                                //   mealC.mealDelete();

                                                mealC.deleteMealData(index);
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),

                                    // how to user Getbuilder with dropdown in flutter
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 53.h,
                                          width: 165.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Center(
                                            child: Text(
                                              mealC.mealData[index]['mealdata'][0]['meal'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFDAA4A)),
                                            ),
                                          ),

                                          //  DropdownButtonFormField2(
                                          //   // dropdownWidth: 315.w,

                                          //   dropdownDecoration: BoxDecoration(
                                          //     color: Colors.white,
                                          //     shape: BoxShape.rectangle,
                                          //     borderRadius: BorderRadius.circular(20),
                                          //   ),
                                          //   buttonPadding: EdgeInsets.symmetric(
                                          //     horizontal: 20.w,
                                          //   ),
                                          //   icon: Icon(
                                          //     Icons.arrow_drop_down_circle,
                                          //     size: 24.h,
                                          //   ),
                                          //   decoration: InputDecoration(
                                          //     isDense: true,
                                          //     // alignLabelWithHint: true,
                                          //     // contentPadding:
                                          //     //     EdgeInsets.symmetric(
                                          //     //         horizontal: 20.w),
                                          //     disabledBorder: InputBorder.none,
                                          //     enabledBorder: InputBorder.none,
                                          //   ),
                                          //   isExpanded: true,
                                          //   iconEnabledColor: Colors.black,
                                          //   buttonWidth: 165.w,
                                          //   buttonHeight: 53.h,
                                          //   hint: Text(
                                          //     'Select',
                                          //     style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                          //   ),
                                          //   value: mealC.mealData[index]['mealdata'][0]['meal'].toString(), //selectedValue != null ? selectedValue : null,
                                          //   onChanged: (value) {
                                          //     // setState(
                                          //     //   () {

                                          //     //     selectedValue = value as String?;

                                          //     //     selectedCat = dc.vegData.where((g) => g['title'] == selectedValue).map((g) => g).toList();

                                          //     //     examples = [];
                                          //     //     selectedValue4 = null;
                                          //     //     examples = selectedCat[0]['examples'];

                                          //     //     // var a = dc.vegData[]

                                          //     //     // //print(a[0]['examples'][0]);
                                          //     //   },
                                          //     // );

                                          //     // // how to do 15 multiply by count

                                          //     // dc.setKCal(selectedCat[0]['kCal']);

                                          //     // dc.finalkCal.value = dc.kCal.value;

                                          //     // // dc.exampleDat = selectedCat[0]['examples'];
                                          //   },

                                          //   // how to get the string array from object if selected value is matched
                                          //   items: mealC.vegData
                                          //       .map(
                                          //         (item) => DropdownMenuItem<String>(
                                          //           value: item['title'].toString(),
                                          //           child: Text(
                                          //             item['title'],
                                          //             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                          //           ),
                                          //         ),
                                          //       )
                                          //       .toList(),
                                          // ),
                                        ),
                                        Container(
                                          height: 53.h,
                                          width: 165.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10.r),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                // Container(
                                                //   height: 34.h,
                                                //   width: 34.w,
                                                //   decoration: BoxDecoration(
                                                //     gradient: kprimary,
                                                //     shape: BoxShape.circle,
                                                //   ),
                                                //   child: Center(
                                                //     child: IconButton(
                                                //       icon: Icon(
                                                //         Icons.remove,
                                                //         size: 12.sp,
                                                //         color: Colors.white,
                                                //       ),
                                                //       onPressed: () {
                                                //         // mealC.decrementCounter();
                                                //       },
                                                //       color: Colors.green,
                                                //     ),
                                                //   ),
                                                // ),
                                                Text("Qty: "),
                                                Text(
                                                  mealC.mealData[index]['mealdata'][0]['qty'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Color(0xffFDAA4A),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                // Container(
                                                //   height: 34.h,
                                                //   width: 34.w,
                                                //   decoration: BoxDecoration(
                                                //     gradient: kprimary,
                                                //     shape: BoxShape.circle,
                                                //   ),
                                                //   child: IconButton(
                                                //     icon: Icon(
                                                //       Icons.add,
                                                //       size: 12.sp,
                                                //       color: Colors.white,
                                                //     ),
                                                //     onPressed: () {
                                                //       //  mealC.increaseCounter();
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 53.h,
                                          width: 214.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Center(
                                            child: Text(
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFDAA4A)),
                                              mealC.mealData[index]['mealdata'][0]['example'][0].toString(),
                                            ),
                                            //  DropdownButtonFormField2(
                                            //   // dropdownWidth: 315.w,

                                            //   dropdownDecoration: BoxDecoration(
                                            //     color: Colors.white,
                                            //     shape: BoxShape.rectangle,
                                            //     borderRadius: BorderRadius.circular(20),
                                            //   ),
                                            //   buttonPadding: EdgeInsets.symmetric(
                                            //     horizontal: 20.w,
                                            //   ),
                                            //   icon: Icon(
                                            //     Icons.arrow_drop_down_circle,
                                            //     size: 24.h,
                                            //   ),
                                            //   decoration: InputDecoration(
                                            //     isDense: true,
                                            //     // alignLabelWithHint: true,
                                            //     // contentPadding:
                                            //     //     EdgeInsets.symmetric(
                                            //     //         horizontal: 20.w),
                                            //     disabledBorder: InputBorder.none,
                                            //     enabledBorder: InputBorder.none,
                                            //   ),
                                            //   isExpanded: true,
                                            //   iconEnabledColor: Colors.black,
                                            //   buttonWidth: 165.w,
                                            //   buttonHeight: 53.h,
                                            //   hint: Text(
                                            //     "select",
                                            //     style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                            //   ),

                                            //   value: mealC.mealData[index]['mealdata'][0]['example'][0].toString(), // selectedValue4 != null ? selectedValue4 : null,
                                            //   onChanged: (value) {
                                            //     // setState(
                                            //     //   () {
                                            //     //     selectedValue4 = value as String?;
                                            //     //   },
                                            //     // );
                                            //   },
                                            //   items: examples
                                            //       .map(
                                            //         (item) => DropdownMenuItem(
                                            //           value: item.toString(),
                                            //           child: Text(
                                            //             item,
                                            //             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            //           ),
                                            //         ),
                                            //       )
                                            //       .toList(),
                                            // ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Kcal:",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                mealC.mealData[index]['mealdata'][0]['kcal'].toString(),
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Color(0xffFDAA4A),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 21.h,
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 53.h,
                                          width: 165.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Center(
                                            child: Text(
                                              mealC.mealData[index]['mealdata'][1]['meal'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFDAA4A)),
                                            ),
                                          ),

                                          //  GetBuilder<DietController>(
                                          //   builder: (nonVgC) =>

                                          //   DropdownButtonFormField2(
                                          //     // dropdownWidth: 315.w,

                                          //     dropdownDecoration: BoxDecoration(
                                          //       color: Colors.white,
                                          //       shape: BoxShape.rectangle,
                                          //       borderRadius: BorderRadius.circular(20),
                                          //     ),
                                          //     buttonPadding: EdgeInsets.symmetric(
                                          //       horizontal: 20.w,
                                          //     ),
                                          //     icon: Icon(
                                          //       Icons.arrow_drop_down_circle,
                                          //       size: 24.h,
                                          //     ),
                                          //     decoration: InputDecoration(
                                          //       isDense: true,
                                          //       // alignLabelWithHint: true,
                                          //       // contentPadding:
                                          //       //     EdgeInsets.symmetric(
                                          //       //         horizontal: 20.w),
                                          //       disabledBorder: InputBorder.none,
                                          //       enabledBorder: InputBorder.none,
                                          //     ),
                                          //     isExpanded: true,
                                          //     iconEnabledColor: Colors.black,
                                          //     buttonWidth: 165.w,
                                          //     buttonHeight: 53.h,
                                          //     hint: Text(
                                          //       'Select',
                                          //       style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                          //     ),
                                          //     value: mealC.mealData[index]['mealdata'][1]['meal'].toString(), // nonVegSelectedValue != null ? nonVegSelectedValue : null,
                                          //     onChanged: (value) {
                                          //       // setState(
                                          //       //   () {
                                          //       //     nonVegSelectedValue = value as String?;

                                          //       //     nonVegSelectedCat = nonVgC.nonVegData.where((g) => g['title'] == nonVegSelectedValue).map((g) => g).toList();

                                          //       //     nonVegExamples = [];
                                          //       //     nonVegCategorySelectedValue = null;
                                          //       //     nonVegExamples = nonVegSelectedCat[0]['examples'];

                                          //       //     // var a = dc.vegData[]

                                          //       //     // //print(a[0]['examples'][0]);
                                          //       //   },
                                          //       // );
                                          //       // // how to do 15 multiply by count

                                          //       // nonVgC.nonVegSetKCal(nonVegSelectedCat[0]['kCal']);

                                          //       // nonVgC.nonVegfinalkCal.value = nonVgC.nonVegkCal.value;

                                          //       // // dc.exampleDat = selectedCat[0]['examples'];
                                          //     },

                                          //     // how to get the string array from object if selected value is matched
                                          //     items: nonVgC.nonVegData
                                          //         .map(
                                          //           (item) => DropdownMenuItem<String>(
                                          //             value: item['title'].toString(),
                                          //             child: Text(
                                          //               item['title'],
                                          //               style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                          //             ),
                                          //           ),
                                          //         )
                                          //         .toList(),
                                          //   ),
                                          // ),

                                          //  GetBuilder<DietController>(
                                          //   builder: (nonVegC) => DropdownButtonFormField2(
                                          //     // dropdownWidth: 315.w,
                                          //     dropdownDecoration: BoxDecoration(
                                          //       color: Colors.white,
                                          //       shape: BoxShape.rectangle,
                                          //       borderRadius: BorderRadius.circular(20),
                                          //     ),
                                          //     buttonPadding: EdgeInsets.symmetric(
                                          //       horizontal: 20.w,
                                          //     ),
                                          //     icon: Icon(
                                          //       Icons.arrow_drop_down_circle,
                                          //       size: 24.h,
                                          //     ),
                                          //     decoration: InputDecoration(
                                          //       isDense: true,
                                          //       // alignLabelWithHint: true,
                                          //       // contentPadding:
                                          //       //     EdgeInsets.symmetric(
                                          //       //         horizontal: 20.w),
                                          //       disabledBorder: InputBorder.none,
                                          //       enabledBorder: InputBorder.none,
                                          //     ),
                                          //     isExpanded: true,
                                          //     iconEnabledColor: Colors.black,
                                          //     buttonWidth: 165.w,
                                          //     buttonHeight: 53.h,
                                          //     hint: Text(
                                          //       'Carrot',
                                          //       style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                          //     ),
                                          //     value: nonVegSelectedValue,
                                          //     onChanged: (value) {
                                          //       setState(
                                          //         () {
                                          //           nonVegSelectedValue = value as String?;
                                          //         },
                                          //       );
                                          //     },
                                          //     items: nonVegC.nonVegData
                                          //         .map(
                                          //           (item) => DropdownMenuItem<String>(
                                          //             value: item['title'].toString(),
                                          //             child: Text(
                                          //               item,
                                          //               style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                          //             ),
                                          //           ),
                                          //         )
                                          //         .toList(),
                                          //   ),
                                          // ),
                                        ),
                                        Container(
                                          height: 53.h,
                                          width: 165.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10.r),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                // Container(
                                                //   height: 34.h,
                                                //   width: 34.w,
                                                //   decoration: BoxDecoration(
                                                //     gradient: kprimary,
                                                //     shape: BoxShape.circle,
                                                //   ),
                                                //   child: Center(
                                                //     child: IconButton(
                                                //       icon: Icon(
                                                //         Icons.remove,
                                                //         size: 12.sp,
                                                //         color: Colors.white,
                                                //       ),
                                                //       onPressed: () {
                                                //         // setState(
                                                //         //   () {
                                                //         //     mealC.nonVegDecrementCounter();
                                                //         //   },
                                                //         // );
                                                //       },
                                                //       color: Colors.green,
                                                //     ),
                                                //   ),
                                                // ),
                                                Text("Qty : "),
                                                Text(
                                                  mealC.mealData[index]['mealdata'][1]['qty'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Color(0xffFDAA4A),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                // Container(
                                                //   height: 34.h,
                                                //   width: 34.w,
                                                //   decoration: BoxDecoration(
                                                //     gradient: kprimary,
                                                //     shape: BoxShape.circle,
                                                //   ),
                                                //   child: IconButton(
                                                //     icon: Icon(
                                                //       Icons.add,
                                                //       size: 12.sp,
                                                //       color: Colors.white,
                                                //     ),
                                                //     onPressed: () {
                                                //       // nonVegIC.nonVegIncreaseCounter();
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                          height: 53.h,
                                          width: 214.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Center(
                                              child: Text(
                                            mealC.mealData[index]['mealdata'][1]['example'][0].toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFDAA4A)),
                                          )
                                              // DropdownButtonFormField2(
                                              //   // dropdownWidth: 315.w,

                                              //   dropdownDecoration: BoxDecoration(
                                              //     color: Colors.white,
                                              //     shape: BoxShape.rectangle,
                                              //     borderRadius: BorderRadius.circular(20),
                                              //   ),
                                              //   buttonPadding: EdgeInsets.symmetric(
                                              //     horizontal: 20.w,
                                              //   ),
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_circle,
                                              //     size: 24.h,
                                              //   ),
                                              //   decoration: InputDecoration(
                                              //     isDense: true,
                                              //     // alignLabelWithHint: true,
                                              //     // contentPadding:
                                              //     //     EdgeInsets.symmetric(
                                              //     //         horizontal: 20.w),
                                              //     disabledBorder: InputBorder.none,
                                              //     enabledBorder: InputBorder.none,
                                              //   ),
                                              //   isExpanded: true,
                                              //   iconEnabledColor: Colors.black,
                                              //   buttonWidth: 165.w,
                                              //   buttonHeight: 53.h,
                                              //   hint: Text(
                                              //     "select",
                                              //     style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                              //   ),
                                              //   value: mealC.mealData[index]['mealdata'][1]['example'][0].toString(), // nonVegCategorySelectedValue != null ? nonVegCategorySelectedValue : null,
                                              //   onChanged: (value) {
                                              //     setState(
                                              //       () {
                                              //         nonVegCategorySelectedValue = value as String?;
                                              //       },
                                              //     );
                                              //   },

                                              //   items: nonVegExamples
                                              //       .map(
                                              //         (item) => DropdownMenuItem(
                                              //           value: item.toString(),
                                              //           child: Text(
                                              //             item,
                                              //             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                              //           ),
                                              //         ),
                                              //       )
                                              //       .toList(),
                                              // ),

                                              ),
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Kcal:",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                mealC.mealData[index]['mealdata'][1]['kcal'].toString(),
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Color(0xffFDAA4A),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 21.h,
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 53.h,
                                            width: 165.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50.r),
                                              border: Border.all(color: Colors.grey),
                                            ),
                                            child: Center(
                                              child: Text(
                                                mealC.mealData[index]['mealdata'][2]['meal'].toString(),
                                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFDAA4A)),
                                              ),
                                            )

                                            //  DropdownButtonFormField2(
                                            //   // dropdownWidth: 315.w,

                                            //   dropdownDecoration: BoxDecoration(
                                            //     color: Colors.white,
                                            //     shape: BoxShape.rectangle,
                                            //     borderRadius: BorderRadius.circular(20),
                                            //   ),
                                            //   buttonPadding: EdgeInsets.symmetric(
                                            //     horizontal: 20.w,
                                            //   ),
                                            //   icon: Icon(
                                            //     Icons.arrow_drop_down_circle,
                                            //     size: 24.h,
                                            //   ),
                                            //   decoration: InputDecoration(
                                            //     isDense: true,
                                            //     // alignLabelWithHint: true,
                                            //     // contentPadding:
                                            //     //     EdgeInsets.symmetric(
                                            //     //         horizontal: 20.w),
                                            //     disabledBorder: InputBorder.none,
                                            //     enabledBorder: InputBorder.none,
                                            //   ),
                                            //   isExpanded: true,
                                            //   iconEnabledColor: Colors.black,
                                            //   buttonWidth: 165.w,
                                            //   buttonHeight: 53.h,
                                            //   hint: Text(
                                            //     'Select',
                                            //     style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                            //   ),
                                            //   value: mealC.mealData[index]['mealdata'][2]['meal'].toString(), // cropSelectedValue != null ? cropSelectedValue : null,
                                            //   onChanged: (value) {
                                            //     // setState(
                                            //     //   () {
                                            //     //     cropSelectedValue = value as String?;

                                            //     //     cropSelectedCat = cropC.cropData.where((g) => g['title'] == cropSelectedValue).map((g) => g).toList();

                                            //     //     cropExamples = [];
                                            //     //     cropCategorySelectedValue = null;
                                            //     //     cropExamples = cropSelectedCat[0]['examples'];

                                            //     //     // var a = dc.vegData[]

                                            //     //     // //print(a[0]['examples'][0]);
                                            //     //   },
                                            //     // );
                                            //     // // how to do 15 multiply by count

                                            //     // cropC.cropSetKCal(cropSelectedCat[0]['kCal']);

                                            //     // cropC.cropfinalkCal.value = cropC.cropkCal.value;

                                            //     // // dc.exampleDat = selectedCat[0]['examples'];
                                            //   },

                                            //   // how to get the string array from object if selected value is matched
                                            //   items: mealC.cropData
                                            //       .map(
                                            //         (item) => DropdownMenuItem<String>(
                                            //           value: item['title'].toString(),
                                            //           child: Text(
                                            //             item['title'],
                                            //             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            //           ),
                                            //         ),
                                            //       )
                                            //       .toList(),
                                            // ),

                                            ),
                                        Container(
                                            height: 53.h,
                                            width: 165.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50.r),
                                              border: Border.all(color: Colors.grey),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  // Container(
                                                  //   height: 34.h,
                                                  //   width: 34.w,
                                                  //   decoration: BoxDecoration(
                                                  //     gradient: kprimary,
                                                  //     shape: BoxShape.circle,
                                                  //   ),
                                                  //   child: Center(
                                                  //     child: IconButton(
                                                  //       icon: Icon(
                                                  //         Icons.remove,
                                                  //         size: 12.sp,
                                                  //         color: Colors.white,
                                                  //       ),
                                                  //       onPressed: () {
                                                  //         //mealC.cropDecrementCounter();
                                                  //       },
                                                  //       color: Colors.green,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  Text("Qty:"),
                                                  Text(
                                                    mealC.mealData[index]['mealdata'][2]['qty'].toString(),
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Color(0xffFDAA4A),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  // Container(
                                                  //   height: 34.h,
                                                  //   width: 34.w,
                                                  //   decoration: BoxDecoration(
                                                  //     gradient: kprimary,
                                                  //     shape: BoxShape.circle,
                                                  //   ),
                                                  //   child: IconButton(
                                                  //     icon: Icon(
                                                  //       Icons.add,
                                                  //       size: 12.sp,
                                                  //       color: Colors.white,
                                                  //     ),
                                                  //     onPressed: () {
                                                  //       //  mealC.cropIncreaseCounter();
                                                  //     },
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                          height: 53.h,
                                          width: 214.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Center(
                                              child: Text(
                                            mealC.mealData[index]['mealdata'][2]['example'][0].toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFDAA4A)),
                                          )

                                              //  DropdownButtonFormField2(
                                              //   // dropdownWidth: 315.w,

                                              //   dropdownDecoration: BoxDecoration(
                                              //     color: Colors.white,
                                              //     shape: BoxShape.rectangle,
                                              //     borderRadius: BorderRadius.circular(20),
                                              //   ),
                                              //   buttonPadding: EdgeInsets.symmetric(
                                              //     horizontal: 20.w,
                                              //   ),
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_circle,
                                              //     size: 24.h,
                                              //   ),
                                              //   decoration: InputDecoration(
                                              //     isDense: true,
                                              //     // alignLabelWithHint: true,
                                              //     // contentPadding:
                                              //     //     EdgeInsets.symmetric(
                                              //     //         horizontal: 20.w),
                                              //     disabledBorder: InputBorder.none,
                                              //     enabledBorder: InputBorder.none,
                                              //   ),
                                              //   isExpanded: true,
                                              //   iconEnabledColor: Colors.black,
                                              //   buttonWidth: 165.w,
                                              //   buttonHeight: 53.h,
                                              //   hint: Text(
                                              //     "select",
                                              //     style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                              //   ),
                                              //   value: mealC.mealData[index]['mealdata'][2]['example'][0].toString(), //cropCategorySelectedValue != null ? cropCategorySelectedValue : null,

                                              //   onChanged: (value) {
                                              //     // setState(
                                              //     //   () {
                                              //     //     cropCategorySelectedValue = value as String?;
                                              //     //   },
                                              //     // );
                                              //   },

                                              //   items: cropExamples
                                              //       .map(
                                              //         (item) => DropdownMenuItem(
                                              //           value: item.toString(),
                                              //           child: Text(
                                              //             item,
                                              //             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                              //           ),
                                              //         ),
                                              //       )
                                              //       .toList(),
                                              // ),

                                              ),
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Kcal:",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                mealC.mealData[index]['mealdata'][2]['kcal'].toString(),
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Color(0xffFDAA4A),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Container(
                                      height: 56.h,
                                      width: 375.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.r),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Total Kcal of meal ${_index + 1}:${mealC.mealData[index]['mealdata'][0]['kcal'] + mealC.mealData[index]['mealdata'][1]['kcal'] + mealC.mealData[index]['mealdata'][2]['kcal']} ",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),

                      //to add
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Meal", // ${index + 1}
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),

                          // how to user Getbuilder with dropdown in flutter
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 53.h,
                                width: 165.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: GetBuilder<DietController>(
                                  builder: (dc) => DropdownButtonFormField2(
                                    // dropdownWidth: 315.w,

                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    buttonPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      size: 24.h,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      // alignLabelWithHint: true,
                                      // contentPadding:
                                      //     EdgeInsets.symmetric(
                                      //         horizontal: 20.w),
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    iconEnabledColor: Colors.black,
                                    buttonWidth: 165.w,
                                    buttonHeight: 53.h,
                                    hint: Text(
                                      'Select',
                                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                    ),
                                    value: selectedValue != null ? selectedValue : null,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedValue = value as String?;

                                          selectedCat = dc.vegData.where((g) => g['title'] == selectedValue).map((g) => g).toList();

                                          examples = [];
                                          selectedValue4 = null;
                                          examples = selectedCat[0]['examples'];

                                          // var a = dc.vegData[]

                                          // //print(a[0]['examples'][0]);
                                        },
                                      );

                                      // how to do 15 multiply by count

                                      dc.setKCal(selectedCat[0]['kCal']);

                                      dc.finalkCal.value = dc.kCal.value;

                                      // dc.exampleDat = selectedCat[0]['examples'];
                                    },

                                    // how to get the string array from object if selected value is matched
                                    items: dc.vegData
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item['title'].toString(),
                                            child: Text(
                                              item['title'],
                                              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 53.h,
                                width: 165.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 34.h,
                                        width: 34.w,
                                        decoration: BoxDecoration(
                                          gradient: kprimary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: GetBuilder<DietController>(
                                            builder: (dcCont) => IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                size: 12.sp,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                dcCont.decrementCounter();
                                              },
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GetBuilder<DietController>(
                                        builder: (cont) => Text(
                                          cont.counter.value.toString(),
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 34.h,
                                        width: 34.w,
                                        decoration: BoxDecoration(
                                          gradient: kprimary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: GetBuilder<DietController>(
                                          builder: (Incont) => IconButton(
                                            icon: Icon(
                                              Icons.add,
                                              size: 12.sp,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              Incont.increaseCounter();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 53.h,
                                width: 214.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: DropdownButtonFormField2(
                                    // dropdownWidth: 315.w,

                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    buttonPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      size: 24.h,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      // alignLabelWithHint: true,
                                      // contentPadding:
                                      //     EdgeInsets.symmetric(
                                      //         horizontal: 20.w),
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    iconEnabledColor: Colors.black,
                                    buttonWidth: 165.w,
                                    buttonHeight: 53.h,
                                    hint: Text(
                                      "select",
                                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                    ),
                                    value: selectedValue4 != null ? selectedValue4 : null,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedValue4 = value as String?;
                                        },
                                      );
                                    },
                                    items: examples
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item.toString(),
                                            child: Text(
                                              item,
                                              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 29.w,
                              ),
                              GetBuilder<DietController>(
                                builder: (kCal) => Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Kcal:",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      selectedCat.isNotEmpty
                                          ? Text(
                                              kCal.finalkCal.value.toString(),
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          : Text(
                                              "0",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 21.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 53.h,
                                width: 165.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: GetBuilder<DietController>(
                                  builder: (nonVgC) => DropdownButtonFormField2(
                                    // dropdownWidth: 315.w,

                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    buttonPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      size: 24.h,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      // alignLabelWithHint: true,
                                      // contentPadding:
                                      //     EdgeInsets.symmetric(
                                      //         horizontal: 20.w),
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    iconEnabledColor: Colors.black,
                                    buttonWidth: 165.w,
                                    buttonHeight: 53.h,
                                    hint: Text(
                                      'Select',
                                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                    ),
                                    value: nonVegSelectedValue != null ? nonVegSelectedValue : null,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          nonVegSelectedValue = value as String?;

                                          nonVegSelectedCat = nonVgC.nonVegData.where((g) => g['title'] == nonVegSelectedValue).map((g) => g).toList();

                                          nonVegExamples = [];
                                          nonVegCategorySelectedValue = null;
                                          nonVegExamples = nonVegSelectedCat[0]['examples'];

                                          // var a = dc.vegData[]

                                          // //print(a[0]['examples'][0]);
                                        },
                                      );
                                      // how to do 15 multiply by count

                                      nonVgC.nonVegSetKCal(nonVegSelectedCat[0]['kCal']);

                                      nonVgC.nonVegfinalkCal.value = nonVgC.nonVegkCal.value;

                                      // dc.exampleDat = selectedCat[0]['examples'];
                                    },

                                    // how to get the string array from object if selected value is matched
                                    items: nonVgC.nonVegData
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item['title'].toString(),
                                            child: Text(
                                              item['title'],
                                              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),

                                //  GetBuilder<DietController>(
                                //   builder: (nonVegC) => DropdownButtonFormField2(
                                //     // dropdownWidth: 315.w,
                                //     dropdownDecoration: BoxDecoration(
                                //       color: Colors.white,
                                //       shape: BoxShape.rectangle,
                                //       borderRadius: BorderRadius.circular(20),
                                //     ),
                                //     buttonPadding: EdgeInsets.symmetric(
                                //       horizontal: 20.w,
                                //     ),
                                //     icon: Icon(
                                //       Icons.arrow_drop_down_circle,
                                //       size: 24.h,
                                //     ),
                                //     decoration: InputDecoration(
                                //       isDense: true,
                                //       // alignLabelWithHint: true,
                                //       // contentPadding:
                                //       //     EdgeInsets.symmetric(
                                //       //         horizontal: 20.w),
                                //       disabledBorder: InputBorder.none,
                                //       enabledBorder: InputBorder.none,
                                //     ),
                                //     isExpanded: true,
                                //     iconEnabledColor: Colors.black,
                                //     buttonWidth: 165.w,
                                //     buttonHeight: 53.h,
                                //     hint: Text(
                                //       'Carrot',
                                //       style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                //     ),
                                //     value: nonVegSelectedValue,
                                //     onChanged: (value) {
                                //       setState(
                                //         () {
                                //           nonVegSelectedValue = value as String?;
                                //         },
                                //       );
                                //     },
                                //     items: nonVegC.nonVegData
                                //         .map(
                                //           (item) => DropdownMenuItem<String>(
                                //             value: item['title'].toString(),
                                //             child: Text(
                                //               item,
                                //               style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                //             ),
                                //           ),
                                //         )
                                //         .toList(),
                                //   ),
                                // ),
                              ),
                              Container(
                                height: 53.h,
                                width: 165.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 34.h,
                                        width: 34.w,
                                        decoration: BoxDecoration(
                                          gradient: kprimary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: GetBuilder<DietController>(
                                            builder: (nonVegDC) => IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                size: 12.sp,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    nonVegDC.nonVegDecrementCounter();
                                                  },
                                                );
                                              },
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GetBuilder<DietController>(
                                        builder: (nonVegC) => Text(
                                          nonVegC.nonVegcounter.value.toString(),
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 34.h,
                                        width: 34.w,
                                        decoration: BoxDecoration(
                                          gradient: kprimary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: GetBuilder<DietController>(
                                          builder: (nonVegIC) => IconButton(
                                            icon: Icon(
                                              Icons.add,
                                              size: 12.sp,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              nonVegIC.nonVegIncreaseCounter();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 53.h,
                                width: 214.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: DropdownButtonFormField2(
                                    // dropdownWidth: 315.w,

                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    buttonPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      size: 24.h,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      // alignLabelWithHint: true,
                                      // contentPadding:
                                      //     EdgeInsets.symmetric(
                                      //         horizontal: 20.w),
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    iconEnabledColor: Colors.black,
                                    buttonWidth: 165.w,
                                    buttonHeight: 53.h,
                                    hint: Text(
                                      "select",
                                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                    ),
                                    value: nonVegCategorySelectedValue != null ? nonVegCategorySelectedValue : null,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          nonVegCategorySelectedValue = value as String?;
                                        },
                                      );
                                    },

                                    items: nonVegExamples
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item.toString(),
                                            child: Text(
                                              item,
                                              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 29.w,
                              ),
                              GetBuilder<DietController>(
                                builder: (nonVegkCalC) => Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Kcal:",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      nonVegSelectedCat.isNotEmpty
                                          ? Text(
                                              nonVegkCalC.nonVegfinalkCal.value.toString(),
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          : Text(
                                              "0",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 21.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 53.h,
                                width: 165.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: GetBuilder<DietController>(
                                  builder: (cropC) => DropdownButtonFormField2(
                                    // dropdownWidth: 315.w,

                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    buttonPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      size: 24.h,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      // alignLabelWithHint: true,
                                      // contentPadding:
                                      //     EdgeInsets.symmetric(
                                      //         horizontal: 20.w),
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    iconEnabledColor: Colors.black,
                                    buttonWidth: 165.w,
                                    buttonHeight: 53.h,
                                    hint: Text(
                                      'Select',
                                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                    ),
                                    value: cropSelectedValue != null ? cropSelectedValue : null,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          cropSelectedValue = value as String?;

                                          cropSelectedCat = cropC.cropData.where((g) => g['title'] == cropSelectedValue).map((g) => g).toList();

                                          cropExamples = [];
                                          cropCategorySelectedValue = null;
                                          cropExamples = cropSelectedCat[0]['examples'];

                                          // var a = dc.vegData[]

                                          // //print(a[0]['examples'][0]);
                                        },
                                      );
                                      // how to do 15 multiply by count

                                      cropC.cropSetKCal(cropSelectedCat[0]['kCal']);

                                      cropC.cropfinalkCal.value = cropC.cropkCal.value;

                                      // dc.exampleDat = selectedCat[0]['examples'];
                                    },

                                    // how to get the string array from object if selected value is matched
                                    items: cropC.cropData
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item['title'].toString(),
                                            child: Text(
                                              item['title'],
                                              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 53.h,
                                  width: 165.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          height: 34.h,
                                          width: 34.w,
                                          decoration: BoxDecoration(
                                            gradient: kprimary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: GetBuilder<DietController>(
                                              builder: (cropDC) => IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 12.sp,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  cropDC.cropDecrementCounter();
                                                },
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ),
                                        GetBuilder<DietController>(
                                          builder: (cropCountC) => Text(
                                            cropCountC.cropCounter.value.toString(),
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 34.h,
                                          width: 34.w,
                                          decoration: BoxDecoration(
                                            gradient: kprimary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: GetBuilder<DietController>(
                                            builder: (cropDC) => IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                size: 12.sp,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                cropDC.cropIncreaseCounter();
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 53.h,
                                width: 214.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: DropdownButtonFormField2(
                                    // dropdownWidth: 315.w,

                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    buttonPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      size: 24.h,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      // alignLabelWithHint: true,
                                      // contentPadding:
                                      //     EdgeInsets.symmetric(
                                      //         horizontal: 20.w),
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    iconEnabledColor: Colors.black,
                                    buttonWidth: 165.w,
                                    buttonHeight: 53.h,
                                    hint: Text(
                                      "select",
                                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                    ),
                                    value: cropCategorySelectedValue != null ? cropCategorySelectedValue : null,

                                    onChanged: (value) {
                                      setState(
                                        () {
                                          cropCategorySelectedValue = value as String?;
                                        },
                                      );
                                    },

                                    items: cropExamples
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item.toString(),
                                            child: Text(
                                              item,
                                              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 29.w,
                              ),
                              GetBuilder<DietController>(
                                builder: (cropkCalC) => Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Kcal:",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      cropSelectedCat.isNotEmpty
                                          ? Text(
                                              cropkCalC.cropfinalkCal.value.toString(),
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          : Text(
                                              "0",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 56.h,
                            width: 375.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: GetBuilder<DietController>(
                                builder: (controller) => Text(
                                  "Total Kcal of meal ${_index + 1}:${controller.finalkCal.value + controller.cropfinalkCal.value + controller.nonVegfinalkCal.value} ",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_dietController.mealData.length > 2) {
                            //mealCount.value == 3 || _dietController.mealCount.value > 3
                            Get.snackbar("Cannot add more then 3 meal", '');
                          } else {
                            if (selectedValue != null &&
                                nonVegSelectedValue != null &&
                                cropSelectedValue != null &&
                                selectedValue4 != null &&
                                cropCategorySelectedValue != null &&
                                nonVegCategorySelectedValue != null &&
                                _dietController.counter.value > 0 &&
                                _dietController.nonVegcounter.value > 0 &&
                                _dietController.cropCounter.value > 0) {
                              var mealEntry = {
                                "mealdata": [
                                  {
                                    "meal": "${selectedCat[0]['title']}",
                                    "qty": _dietController.counter.value,
                                    "example": [
                                      "$selectedValue4",
                                    ],
                                    "kcal": _dietController.finalkCal.value
                                  }, //call kar
                                  {
                                    "meal": "${nonVegSelectedCat[0]['title']}",
                                    "qty": _dietController.nonVegcounter.value,
                                    "example": ["${nonVegCategorySelectedValue}"],
                                    "kcal": _dietController.nonVegfinalkCal.value
                                  },
                                  {
                                    "meal": "${cropSelectedCat[0]["title"]}",
                                    "qty": _dietController.cropCounter.value,
                                    "example": ["${cropCategorySelectedValue}"],
                                    "kcal": _dietController.cropfinalkCal.value
                                  }
                                ],
                                "meal": _dietController.mealCount.value,
                                "totalmeal": " ${_dietController.finalkCal.value + _dietController.cropfinalkCal.value + _dietController.nonVegfinalkCal.value}"
                              };

                              // mealEntries.add(mealEntry);

                              //

                              _dietController.addMealData(mealEntry);

                              //

                              //print('meal entries ' + mealEntries.toString());
                              // dietObjects = {
                              //   "mealEntries": mealEntries,
                              // };

                              //print("meal entries" + dietObjects.toString());

                              selectedValue = null;
                              selectedValue4 = null;

                              _dietController.finalkCal.value = 0;
                              _dietController.counter.value = 1;

                              nonVegSelectedValue = null;
                              nonVegCategorySelectedValue = null;

                              _dietController.nonVegfinalkCal.value = 0;
                              _dietController.nonVegcounter.value = 1;

                              cropSelectedValue = null;
                              cropCategorySelectedValue = null;

                              _dietController.cropfinalkCal.value = 0;
                              _dietController.cropCounter.value = 1;

                              _dietController.increaseMealCount();
                            } else {
                              Get.snackbar("Please select Meal ${_dietController.mealCount.value} details first", "");
                            }
                          }
                        },
                        child: Container(
                          width: 356.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            gradient: kprimary,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add More",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      GestureDetector(
                        onTap: () {
                        

                          if (mealC.mealData.isEmpty && selectedValue4 == null ||
                              selectedValue == null ||
                              nonVegCategorySelectedValue == null ||
                              nonVegSelectedValue == null ||
                              cropCategorySelectedValue == null ||
                              cropSelectedValue == null ||
                              _dietController.counter.value == 0 ||
                              _dietController.nonVegcounter.value == 0 ||
                              _dietController.cropCounter.value == 0) {
                            Get.snackbar("please add meal ", "");
                          } else if (mealC.mealData.isNotEmpty &&
                              selectedValue == null &&
                              selectedValue4 == null &&
                              nonVegSelectedValue == null &&
                              nonVegCategorySelectedValue == null &&
                              cropCategorySelectedValue == null &&
                              cropSelectedValue == null) {
                            mealEntries.addAll(mealC.mealData);

                            dietObjects = {"mealEntries": mealEntries, "day": widget.dayName, "totaldiet": 12000};
//

                            // Map map = {"day": widget.dayName, "totaldiet": 12000};
                            // dietObjects.addAll(map);
                            dietEntries.add(dietObjects);

                            //print(dietEntries.toString());
                            _dietController.mealData.clear();
                            _dietController.counter.value = 1;
                            _dietController.cropCounter.value = 1;
                            _dietController.nonVegcounter.value = 1;
                            Get.to(() => DietPlanDays(
                                  count: widget.count,
                                  day: widget.day,
                                  month: widget.month,
                                  year: widget.year,
                                  boolList: widget.booList,
                                ));
                          } else if (mealC.mealData.isNotEmpty && selectedValue != null ||
                              selectedValue4 != null ||
                              nonVegCategorySelectedValue != null ||
                              nonVegSelectedValue != null ||
                              cropCategorySelectedValue != null ||
                              cropSelectedValue != null ||
                              _dietController.counter.value > 0 ||
                              _dietController.nonVegcounter.value > 0 ||
                              _dietController.cropCounter.value > 0) {
                            var mealEntry = {
                              "mealdata": [
                                {
                                  "meal": "${selectedCat[0]['title']}",
                                  "qty": _dietController.counter.value,
                                  "example": [
                                    "$selectedValue4",
                                  ],
                                  "kcal": _dietController.finalkCal.value
                                }, //call kar
                                {
                                  "meal": "${nonVegSelectedCat[0]['title']}",
                                  "qty": _dietController.nonVegcounter.value,
                                  "example": ["${nonVegCategorySelectedValue}"],
                                  "kcal": _dietController.nonVegfinalkCal.value
                                },
                                {
                                  "meal": "${cropSelectedCat[0]["title"]}",
                                  "qty": _dietController.cropCounter.value,
                                  "example": ["${cropCategorySelectedValue}"],
                                  "kcal": _dietController.cropfinalkCal.value
                                }
                              ],
                              "meal": _dietController.mealCount.value,
                              "totalmeal": " ${_dietController.finalkCal.value + _dietController.cropfinalkCal.value + _dietController.nonVegfinalkCal.value}"
                            };

                            // mealEntries.add(mealEntry);

                            //

                            mealC.addMealData(mealEntry);

                            mealEntries.addAll(mealC.mealData);
                            _dietController.mealCount.value = 1;
                            _dietController.counter.value = 1;
                            _dietController.cropCounter.value = 1;
                            _dietController.nonVegcounter.value = 1;
                            dietObjects = {"mealEntries": mealEntries, "day": widget.dayName, "totaldiet": 12000};
//

                            // Map map = {"day": widget.dayName, "totaldiet": 12000};
                            // dietObjects.addAll(map);
                            dietEntries.add(dietObjects);
                              widget.booList[widget.ind-1]=true;

                            //print(dietEntries.toString());
                            _dietController.mealData.clear();
                            Get.to(() => DietPlanDays(
                                  count: widget.count,
                                  day: widget.day,
                                  month: widget.month,
                                  year: widget.year,
                                  boolList: widget.booList,
                                ));
                          } else {
                              
                          widget.booList[widget.ind-1]=true;
                            var mealEntry = {
                              "mealdata": [
                                {
                                  "meal": "${selectedCat[0]['title']}",
                                  "qty": _dietController.counter.value,
                                  "example": [
                                    "$selectedValue4",
                                  ],
                                  "kcal": _dietController.finalkCal.value
                                }, //call kar
                                {
                                  "meal": "${nonVegSelectedCat[0]['title']}",
                                  "qty": _dietController.nonVegcounter.value,
                                  "example": ["${nonVegCategorySelectedValue}"],
                                  "kcal": _dietController.nonVegfinalkCal.value
                                },
                                {
                                  "meal": "${cropSelectedCat[0]["title"]}",
                                  "qty": _dietController.cropCounter.value,
                                  "example": ["${cropCategorySelectedValue}"],
                                  "kcal": _dietController.cropfinalkCal.value
                                }
                              ],
                              "meal": _dietController.mealCount.value,
                              "totalmeal": " ${_dietController.finalkCal.value + _dietController.cropfinalkCal.value + _dietController.nonVegfinalkCal.value}"
                            };

                            // mealEntries.add(mealEntry);

                            //

                            mealC.addMealData(mealEntry);

                            mealEntries.addAll(mealC.mealData);
                            _dietController.mealCount.value = 1;
                            _dietController.counter.value = 1;
                            _dietController.cropCounter.value = 1;
                            _dietController.nonVegcounter.value = 1;
                            dietObjects = {"mealEntries": mealEntries, "day": widget.count, "totaldiet": 12000};

                            dietEntries.add(dietObjects);

                            //print(dietEntries.toString());
                            _dietController.mealData.clear();
                            Get.off(() => DietPlanDays(
                                  count: widget.count,
                                  day: widget.day,
                                  month: widget.month,
                                  year: widget.year,
                                  boolList: widget.booList,
                                ));
                          }
                        },
                        child: Container(
                          width: 356.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            gradient: kprimary,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      50.verticalSpace
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // mutilevel dropdown in flutter
}

// GetBuilder<DietController>(
//                 builder: (mealC) =>

//                  ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount:mealC.mealData.length , //mealC.mealCount.value,
//                   itemBuilder: (context, index) {
//                     _index = index;
//                     if (mealC.mealCount.value > 1) {
//                       _isvisible = true;
//                     } else {
//                       _isvisible = false;
//                     }

//                     return Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Meal ${index + 1}",
//                               style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             Visibility(
//                               visible: _isvisible,
//                               child: IconButton(
//                                   onPressed: () {
//                                     mealC.mealDelete();
//                                   },
//                                   icon: Icon(
//                                     Icons.close,
//                                     color: Colors.red,
//                                   )),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 7.h,
//                         ),

//                         // how to user Getbuilder with dropdown in flutter
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height: 53.h,
//                               width: 165.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.r),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: GetBuilder<DietController>(
//                                 builder: (dc) => DropdownButtonFormField2(
//                                   // dropdownWidth: 315.w,

//                                   dropdownDecoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   buttonPadding: EdgeInsets.symmetric(
//                                     horizontal: 20.w,
//                                   ),
//                                   icon: Icon(
//                                     Icons.arrow_drop_down_circle,
//                                     size: 24.h,
//                                   ),
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     // alignLabelWithHint: true,
//                                     // contentPadding:
//                                     //     EdgeInsets.symmetric(
//                                     //         horizontal: 20.w),
//                                     disabledBorder: InputBorder.none,
//                                     enabledBorder: InputBorder.none,
//                                   ),
//                                   isExpanded: true,
//                                   iconEnabledColor: Colors.black,
//                                   buttonWidth: 165.w,
//                                   buttonHeight: 53.h,
//                                   hint: Text(
//                                     'Select',
//                                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                                   ),
//                                   value: selectedValue != null ? selectedValue : null,
//                                   onChanged: (value) {
//                                     setState(
//                                       () {
//                                         selectedValue = value as String?;

//                                         selectedCat = dc.vegData.where((g) => g['title'] == selectedValue).map((g) => g).toList();

//                                         examples = [];
//                                         selectedValue4 = null;
//                                         examples = selectedCat[0]['examples'];

//                                         // var a = dc.vegData[]

//                                         // //print(a[0]['examples'][0]);
//                                       },
//                                     );

//                                     // how to do 15 multiply by count

//                                     dc.setKCal(selectedCat[0]['kCal']);

//                                     dc.finalkCal.value = dc.kCal.value;

//                                     // dc.exampleDat = selectedCat[0]['examples'];
//                                   },

//                                   // how to get the string array from object if selected value is matched
//                                   items: dc.vegData
//                                       .map(
//                                         (item) => DropdownMenuItem<String>(
//                                           value: item['title'].toString(),
//                                           child: Text(
//                                             item['title'],
//                                             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 53.h,
//                               width: 165.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.r),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 10.r),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Container(
//                                       height: 34.h,
//                                       width: 34.w,
//                                       decoration: BoxDecoration(
//                                         gradient: kprimary,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Center(
//                                         child: GetBuilder<DietController>(
//                                           builder: (dcCont) => IconButton(
//                                             icon: Icon(
//                                               Icons.remove,
//                                               size: 12.sp,
//                                               color: Colors.white,
//                                             ),
//                                             onPressed: () {
//                                               dcCont.decrementCounter();
//                                             },
//                                             color: Colors.green,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     GetBuilder<DietController>(
//                                       builder: (cont) => Text(
//                                         cont.counter.value.toString(),
//                                         style: TextStyle(
//                                           fontSize: 15.sp,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 34.h,
//                                       width: 34.w,
//                                       decoration: BoxDecoration(
//                                         gradient: kprimary,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: GetBuilder<DietController>(
//                                         builder: (Incont) => IconButton(
//                                           icon: Icon(
//                                             Icons.add,
//                                             size: 12.sp,
//                                             color: Colors.white,
//                                           ),
//                                           onPressed: () {
//                                             Incont.increaseCounter();
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 7.h,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 53.h,
//                               width: 214.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.r),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: Center(
//                                 child: DropdownButtonFormField2(
//                                   // dropdownWidth: 315.w,

//                                   dropdownDecoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   buttonPadding: EdgeInsets.symmetric(
//                                     horizontal: 20.w,
//                                   ),
//                                   icon: Icon(
//                                     Icons.arrow_drop_down_circle,
//                                     size: 24.h,
//                                   ),
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     // alignLabelWithHint: true,
//                                     // contentPadding:
//                                     //     EdgeInsets.symmetric(
//                                     //         horizontal: 20.w),
//                                     disabledBorder: InputBorder.none,
//                                     enabledBorder: InputBorder.none,
//                                   ),
//                                   isExpanded: true,
//                                   iconEnabledColor: Colors.black,
//                                   buttonWidth: 165.w,
//                                   buttonHeight: 53.h,
//                                   hint: Text(
//                                     "select",
//                                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                                   ),
//                                   value: selectedValue4 != null ? selectedValue4 : null,
//                                   onChanged: (value) {
//                                     setState(
//                                       () {
//                                         selectedValue4 = value as String?;
//                                       },
//                                     );
//                                   },
//                                   items: examples
//                                       .map(
//                                         (item) => DropdownMenuItem(
//                                           value: item.toString(),
//                                           child: Text(
//                                             item,
//                                             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 29.w,
//                             ),
//                             GetBuilder<DietController>(
//                               builder: (kCal) => Container(
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Kcal:",
//                                       style: TextStyle(
//                                         fontSize: 20.sp,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     selectedCat.isNotEmpty
//                                         ? Text(
//                                             kCal.finalkCal.value.toString(),
//                                             style: TextStyle(
//                                               fontSize: 20.sp,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           )
//                                         : Text(
//                                             "0",
//                                             style: TextStyle(
//                                               fontSize: 20.sp,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         SizedBox(
//                           height: 21.h,
//                         ),
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height: 53.h,
//                               width: 165.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.r),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: GetBuilder<DietController>(
//                                 builder: (nonVgC) => DropdownButtonFormField2(
//                                   // dropdownWidth: 315.w,

//                                   dropdownDecoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   buttonPadding: EdgeInsets.symmetric(
//                                     horizontal: 20.w,
//                                   ),
//                                   icon: Icon(
//                                     Icons.arrow_drop_down_circle,
//                                     size: 24.h,
//                                   ),
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     // alignLabelWithHint: true,
//                                     // contentPadding:
//                                     //     EdgeInsets.symmetric(
//                                     //         horizontal: 20.w),
//                                     disabledBorder: InputBorder.none,
//                                     enabledBorder: InputBorder.none,
//                                   ),
//                                   isExpanded: true,
//                                   iconEnabledColor: Colors.black,
//                                   buttonWidth: 165.w,
//                                   buttonHeight: 53.h,
//                                   hint: Text(
//                                     'Select',
//                                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                                   ),
//                                   value: nonVegSelectedValue != null ? nonVegSelectedValue : null,
//                                   onChanged: (value) {
//                                     setState(
//                                       () {
//                                         nonVegSelectedValue = value as String?;

//                                         nonVegSelectedCat = nonVgC.nonVegData.where((g) => g['title'] == nonVegSelectedValue).map((g) => g).toList();

//                                         nonVegExamples = [];
//                                         nonVegCategorySelectedValue = null;
//                                         nonVegExamples = nonVegSelectedCat[0]['examples'];

//                                         // var a = dc.vegData[]

//                                         // //print(a[0]['examples'][0]);
//                                       },
//                                     );
//                                     // how to do 15 multiply by count

//                                     nonVgC.nonVegSetKCal(nonVegSelectedCat[0]['kCal']);

//                                     nonVgC.nonVegfinalkCal.value = nonVgC.nonVegkCal.value;

//                                     // dc.exampleDat = selectedCat[0]['examples'];
//                                   },

//                                   // how to get the string array from object if selected value is matched
//                                   items: nonVgC.nonVegData
//                                       .map(
//                                         (item) => DropdownMenuItem<String>(
//                                           value: item['title'].toString(),
//                                           child: Text(
//                                             item['title'],
//                                             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ),

//                               //  GetBuilder<DietController>(
//                               //   builder: (nonVegC) => DropdownButtonFormField2(
//                               //     // dropdownWidth: 315.w,
//                               //     dropdownDecoration: BoxDecoration(
//                               //       color: Colors.white,
//                               //       shape: BoxShape.rectangle,
//                               //       borderRadius: BorderRadius.circular(20),
//                               //     ),
//                               //     buttonPadding: EdgeInsets.symmetric(
//                               //       horizontal: 20.w,
//                               //     ),
//                               //     icon: Icon(
//                               //       Icons.arrow_drop_down_circle,
//                               //       size: 24.h,
//                               //     ),
//                               //     decoration: InputDecoration(
//                               //       isDense: true,
//                               //       // alignLabelWithHint: true,
//                               //       // contentPadding:
//                               //       //     EdgeInsets.symmetric(
//                               //       //         horizontal: 20.w),
//                               //       disabledBorder: InputBorder.none,
//                               //       enabledBorder: InputBorder.none,
//                               //     ),
//                               //     isExpanded: true,
//                               //     iconEnabledColor: Colors.black,
//                               //     buttonWidth: 165.w,
//                               //     buttonHeight: 53.h,
//                               //     hint: Text(
//                               //       'Carrot',
//                               //       style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                               //     ),
//                               //     value: nonVegSelectedValue,
//                               //     onChanged: (value) {
//                               //       setState(
//                               //         () {
//                               //           nonVegSelectedValue = value as String?;
//                               //         },
//                               //       );
//                               //     },
//                               //     items: nonVegC.nonVegData
//                               //         .map(
//                               //           (item) => DropdownMenuItem<String>(
//                               //             value: item['title'].toString(),
//                               //             child: Text(
//                               //               item,
//                               //               style: TextStyle(fontSize: 15.sp, color: Colors.grey),
//                               //             ),
//                               //           ),
//                               //         )
//                               //         .toList(),
//                               //   ),
//                               // ),
//                             ),
//                             Container(
//                               height: 53.h,
//                               width: 165.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.r),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 10.r),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Container(
//                                       height: 34.h,
//                                       width: 34.w,
//                                       decoration: BoxDecoration(
//                                         gradient: kprimary,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Center(
//                                         child: GetBuilder<DietController>(
//                                           builder: (nonVegDC) => IconButton(
//                                             icon: Icon(
//                                               Icons.remove,
//                                               size: 12.sp,
//                                               color: Colors.white,
//                                             ),
//                                             onPressed: () {
//                                               setState(
//                                                 () {
//                                                   nonVegDC.nonVegDecrementCounter();
//                                                 },
//                                               );
//                                             },
//                                             color: Colors.green,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     GetBuilder<DietController>(
//                                       builder: (nonVegC) => Text(
//                                         nonVegC.nonVegcounter.value.toString(),
//                                         style: TextStyle(
//                                           fontSize: 15.sp,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 34.h,
//                                       width: 34.w,
//                                       decoration: BoxDecoration(
//                                         gradient: kprimary,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: GetBuilder<DietController>(
//                                         builder: (nonVegIC) => IconButton(
//                                           icon: Icon(
//                                             Icons.add,
//                                             size: 12.sp,
//                                             color: Colors.white,
//                                           ),
//                                           onPressed: () {
//                                             nonVegIC.nonVegIncreaseCounter();
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 7.h,
//                         ),

//                         Row(
//                           children: [
//                             Container(
//                               height: 53.h,
//                               width: 214.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.r),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: Center(
//                                 child: DropdownButtonFormField2(
//                                   // dropdownWidth: 315.w,

//                                   dropdownDecoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   buttonPadding: EdgeInsets.symmetric(
//                                     horizontal: 20.w,
//                                   ),
//                                   icon: Icon(
//                                     Icons.arrow_drop_down_circle,
//                                     size: 24.h,
//                                   ),
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     // alignLabelWithHint: true,
//                                     // contentPadding:
//                                     //     EdgeInsets.symmetric(
//                                     //         horizontal: 20.w),
//                                     disabledBorder: InputBorder.none,
//                                     enabledBorder: InputBorder.none,
//                                   ),
//                                   isExpanded: true,
//                                   iconEnabledColor: Colors.black,
//                                   buttonWidth: 165.w,
//                                   buttonHeight: 53.h,
//                                   hint: Text(
//                                     "select",
//                                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                                   ),
//                                   value: nonVegCategorySelectedValue != null ? nonVegCategorySelectedValue : null,
//                                   onChanged: (value) {
//                                     setState(
//                                       () {
//                                         nonVegCategorySelectedValue = value as String?;
//                                       },
//                                     );
//                                   },

//                                   items: nonVegExamples
//                                       .map(
//                                         (item) => DropdownMenuItem(
//                                           value: item.toString(),
//                                           child: Text(
//                                             item,
//                                             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 29.w,
//                             ),
//                             GetBuilder<DietController>(
//                               builder: (nonVegkCalC) => Container(
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Kcal:",
//                                       style: TextStyle(
//                                         fontSize: 20.sp,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     nonVegSelectedCat.isNotEmpty
//                                         ? Text(
//                                             nonVegkCalC.nonVegfinalkCal.value.toString(),
//                                             style: TextStyle(
//                                               fontSize: 20.sp,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           )
//                                         : Text(
//                                             "0",
//                                             style: TextStyle(
//                                               fontSize: 20.sp,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         SizedBox(
//                           height: 21.h,
//                         ),
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height: 53.h,
//                               width: 165.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.r),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               child: GetBuilder<DietController>(
//                                 builder: (cropC) => DropdownButtonFormField2(
//                                   // dropdownWidth: 315.w,

//                                   dropdownDecoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   buttonPadding: EdgeInsets.symmetric(
//                                     horizontal: 20.w,
//                                   ),
//                                   icon: Icon(
//                                     Icons.arrow_drop_down_circle,
//                                     size: 24.h,
//                                   ),
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     // alignLabelWithHint: true,
//                                     // contentPadding:
//                                     //     EdgeInsets.symmetric(
//                                     //         horizontal: 20.w),
//                                     disabledBorder: InputBorder.none,
//                                     enabledBorder: InputBorder.none,
//                                   ),
//                                   isExpanded: true,
//                                   iconEnabledColor: Colors.black,
//                                   buttonWidth: 165.w,
//                                   buttonHeight: 53.h,
//                                   hint: Text(
//                                     'Select',
//                                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                                   ),
//                                   value: cropSelectedValue != null ? cropSelectedValue : null,
//                                   onChanged: (value) {
//                                     setState(
//                                       () {
//                                         cropSelectedValue = value as String?;

//                                         cropSelectedCat = cropC.cropData.where((g) => g['title'] == cropSelectedValue).map((g) => g).toList();

//                                         cropExamples = [];
//                                         cropCategorySelectedValue = null;
//                                         cropExamples = cropSelectedCat[0]['examples'];

//                                         // var a = dc.vegData[]

//                                         // //print(a[0]['examples'][0]);
//                                       },
//                                     );
//                                     // how to do 15 multiply by count

//                                     cropC.cropSetKCal(cropSelectedCat[0]['kCal']);

//                                     cropC.cropfinalkCal.value = cropC.cropkCal.value;

//                                     // dc.exampleDat = selectedCat[0]['examples'];
//                                   },

//                                   // how to get the string array from object if selected value is matched
//                                   items: cropC.cropData
//                                       .map(
//                                         (item) => DropdownMenuItem<String>(
//                                           value: item['title'].toString(),
//                                           child: Text(
//                                             item['title'],
//                                             style: TextStyle(fontSize: 15.sp, color: Colors.grey),
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                                 height: 53.h,
//                                 width: 165.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50.r),
//                                   border: Border.all(color: Colors.grey),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 10.r),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: <Widget>[
//                                       Container(
//                                         height: 34.h,
//                                         width: 34.w,
//                                         decoration: BoxDecoration(
//                                           gradient: kprimary,
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: Center(
//                                           child: GetBuilder<DietController>(
//                                             builder: (cropDC) => IconButton(
//                                               icon: Icon(
//                                                 Icons.remove,
//                                                 size: 12.sp,
//                                                 color: Colors.white,
//                                               ),
//                                               onPressed: () {
//                                                 cropDC.cropDecrementCounter();
//                                               },
//                                               color: Colors.green,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
