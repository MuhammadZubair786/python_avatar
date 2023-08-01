import 'package:flutter/material.dart';
import 'package:chatbot_app/controllers/bottom_controller.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:chatbot_app/screens/user/NewDietPlan2.dart';

class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({Key? key}) : super(key: key);

  @override
  _LastExampleScreenState createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {
  final bt = Get.put(BottomController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "User Diets",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            bt.navBarChange(1);
            Get.close(1);
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image(image: AssetImage("assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png")),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            // Container(
            //   width: 378.w,
            //   padding: EdgeInsets.symmetric(vertical: 20.r),
            //   // height: 194.h,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(10.r),
            //     ),
            //     color: Colors.white,
            //     border: Border.all(color: Color(0xffD2D2D2)),
            //   ),
            //   child: Column(
            //     children: [
            //       Stack(children: [
            //         Container(
            //           child: CircleAvatar(
            //             child: Image(image: AssetImage("assets/Slicing/Android/4x/Ellipse -3.png")),
            //             radius: 40,
            //           ),
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             border: Border.all(
            //               color: Colors.white,
            //               width: 2.5,
            //             ),
            //           ),
            //         ),
            //         Positioned(
            //           right: -2,
            //           left: 40,
            //           top: 50,
            //           child: RawMaterialButton(
            //             onPressed: () {},
            //             elevation: 2.0,
            //             child: Container(
            //               child: Image.asset(
            //                 "assets/Slicing/Android/4x/verify-1.png",
            //                 scale: 4,
            //               ),
            //             ),
            //             padding: EdgeInsets.all(2),
            //             shape: CircleBorder(),
            //           ),
            //         ),
            //       ]),
            //       SizedBox(
            //         height: 10.h,
            //       ),
            //       Text(
            //         "John Smith",
            //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //       ),
            //       Text(
            //         "Trainer",
            //         style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            //       ),
            //       SizedBox(
            //         height: 10.h,
            //       ),
            //       Text(
            //         "Diet Plan1",
            //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10.h,
            ),
            // Get.to(DietPlan1Screen());
            Expanded(
              child: GetBuilder<GlobalController>(
                builder: (controller) => controller.DietData.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.DietData[0][0]['dietEntries'].length,
                        itemBuilder: (context, index) {
                          //print(controller.DietData[0]['dietEntries']);
                          // return Day2("${index + 1}", "${widget.year}-${widget.month}-${widget.day + index++}", widget.count);

                          //
                          // insert values in list from firest index not 0
                          return GestureDetector(
                            onTap: () {print(controller.DietData[0][0]);
                              Get.to(() => NewDietPlanScreen2(
                                    userDietDataList: controller.DietData[0][0]['dietEntries'][index]['mealEntries'],
                                    day: controller.DietData[0][0]['dietEntries'][index]['day'].toString(),
                                  ));
                            },
                            //  i have list of count now i want to ensure that if user skip the count value
                            child: Container(
                              width: 378.w,
                              height: 87.h,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                                border: Border.all(color: Color(0xffD2D2D2)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.w,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Day ${controller.DietData[0][0]['dietEntries'][index]['day'].toString()} ",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                            // Text(
                                            //   "July 25, 2022",
                                            //   style: TextStyle(color: Colors.black),
                                            // ),
                                            Text(
                                              // "${widget.year}-${widget.month}-${widget.day + index++}",

                                              "",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                            Text(
                                              "",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12),
                                          child: Container(
                                            height: 16.h,
                                            width: 16.w,
                                            // child: Image.asset(
                                            //   "",
                                            // ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );

    //  Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: Text('User Diets'),
    //   ),
    //   body: Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Column(children: [
    //         Expanded(
    //             child: GetBuilder<GlobalController>(
    //           builder: (controller) => controller.DietData.isEmpty
    //               ? Center(
    //                   child: CircularProgressIndicator(),
    //                 )
    //               : ListView.builder(
    //                   itemCount: controller.DietData[0]['dietEntries'].length,
    //                   itemBuilder: (context, index) {
    //                     return Text(controller.DietData[0]['dietEntries'][index]['day'].toString());
    //                     // return Column(
    //                     //   mainAxisAlignment: MainAxisAlignment.start,
    //                     //   crossAxisAlignment: CrossAxisAlignment.start,
    //                     //   children: [
    //                     //     ListTile(
    //                     //       title: Text(snapshot.data!.data![index].shop!.name.toString()),
    //                     //       subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
    //                     //       leading: CircleAvatar(
    //                     //         backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
    //                     //       ),
    //                     //     ),
    //                     //     Container(
    //                     //       height: MediaQuery.of(context).size.height * .3,
    //                     //       width: MediaQuery.of(context).size.width * 1,
    //                     //       child: ListView.builder(
    //                     //           scrollDirection: Axis.horizontal,
    //                     //           itemCount: snapshot.data!.data![index].images!.length,
    //                     //           itemBuilder: (context, position) {
    //                     //             return Padding(
    //                     //               padding: const EdgeInsets.only(right: 10),
    //                     //               child: Container(
    //                     //                 height: MediaQuery.of(context).size.height * .25,
    //                     //                 width: MediaQuery.of(context).size.width * .5,
    //                     //                 decoration: BoxDecoration(
    //                     //                     borderRadius: BorderRadius.circular(10),
    //                     //                     image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()))),
    //                     //               ),
    //                     //             );
    //                     //           }),
    //                     //     ),
    //                     //     Icon(snapshot.data!.data![index].inWishlist! == false ? Icons.favorite : Icons.favorite_outline)
    //                     //   ],
    //                     // );
    //                   }),
    //         ))
    //       ])),
    // );
  }
}
