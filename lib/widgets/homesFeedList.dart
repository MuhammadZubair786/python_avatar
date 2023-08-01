import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/screens/PostLikes.dart';
import 'package:chatbot_app/screens/commentScreen1.dart';
import 'package:chatbot_app/widgets/videoPlayer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UserFeeddList extends StatefulWidget {
  var postList = [];
  var userData;

  var post;

  UserFeeddList({super.key, required this.postList, required this.post, required this.userData});

  @override
  State<UserFeeddList> createState() => _HomesFeedListState();
}

class _HomesFeedListState extends State<UserFeeddList> {
  final _controller = ScrollController();
  var activeindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // actions: [Image.asset("assets/images/Icon awsome-edit.png")],
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              // width: Get.width * 0.39,
              child: Icon(
            Icons.arrow_back,
            color: Colors.amber,
          )),
        ),
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.r),
          child: SingleChildScrollView(
            controller: ScrollController(
              initialScrollOffset: widget.postList.indexOf(widget.post) * 1.sw,
            ),
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.postList.length,
                    itemBuilder: (Builder, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              15.horizontalSpace,
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage("https://gymsta-api.jumppace.com:9000/" + widget.userData['data']['image']['file']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Text(
                                widget.userData['data']['fullName'],
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(
                                Icons.more_horiz,
                                color: Colors.orange,
                              ),
                              10.horizontalSpace
                            ],
                          ),
                          10.verticalSpace,
                          Container(
                              child: CarouselSlider.builder(
                            itemCount: widget.postList[index]['postMedia'].length,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              enableInfiniteScroll: false,
                            ),
                            itemBuilder: (context, mediaIndex, realIdx) {
                              // activeindex = widget.postList[index]['postMedia'][mediaIndex];

                              return widget.postList[index]['postMedia'][mediaIndex]['file'].endsWith(".mp4")
                                  ? Container(
                                      child: widget.postList[index]['postMedia'].length > 1
                                          ? Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                VideoPlayerWidget(videoUrl: "https://gymsta-api.jumppace.com:9000/" + widget.postList[index]['postMedia'][mediaIndex]['file']),
                                                Positioned(
                                                    child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[800]),
                                                  child: Text(
                                                    "${mediaIndex + 1}" + "/" + "${widget.postList[index]['postMedia'].length}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            )
                                          : VideoPlayerWidget(videoUrl: "https://gymsta-api.jumppace.com:9000/" + widget.postList[index]['postMedia'][mediaIndex]['file']))
                                  : Container(
                                      child: Center(
                                          child: widget.postList[index]['postMedia'].length > 1
                                              ? Stack(alignment: Alignment.bottomRight, children: [
                                                  Image.network("https://gymsta-api.jumppace.com:9000/" + widget.postList[index]['postMedia'][mediaIndex]['file'], fit: BoxFit.cover, width: 1000),
                                                  Positioned(
                                                      child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[800]),
                                                    child: Text(
                                                      "${mediaIndex + 1}" + "/" + "${widget.postList[index]['postMedia'].length}",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ))
                                                ])
                                              : Image.network("https://gymsta-api.jumppace.com:9000/" + widget.postList[index]['postMedia'][mediaIndex]['file'], fit: BoxFit.cover, width: 1000)),
                                    );
                            },
                          )),
                          20.verticalSpace,
                          Row(
                            children: [
                              15.horizontalSpace,
                              GestureDetector(
                                onTap: (){
                                  Get.to(()=>PostLikes(postid: widget.postList[index]["_id"]));
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                              10.horizontalSpace,
                              Text(
                                widget.postList[index]['userLikes'].toString(),
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              20.horizontalSpace,
                              GestureDetector(
                                onTap: (){
                                  print(   widget.postList[index]["_id"]);
                                    Get.to(() => CommentScreen1(
                                                      postID:  widget.postList[index]["_id"]
                                                          .toString()));
                                },
                                child: Icon(
                                  Icons.comment,
                                  color: Colors.amber,
                                ),
                              ),
                              10.horizontalSpace,
                              Text(
                                widget.postList[index]['userComments'].toString(),
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              // Spacer(),
                              // Icon(
                              //   Icons.share,
                              //   color: Colors.amber,
                              // )
                            ],
                          ),
                          10.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.horizontalSpace,
                              Text(
                                widget.userData['data']['fullName'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              5.horizontalSpace,
                              Container(
                                width: 0.75.sw,
                                child: Text(
                                  widget.postList[index]['title'],
                                ),
                              )
                            ],
                          ),
                          20.verticalSpace,
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dotIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: 2,
        effect: ExpandingDotsEffect(
          dotWidth: 6,
          dotColor: Color(0xffA4AFBF),
          activeDotColor: Colors.white,
          dotHeight: 6,
        ),
      );
}
