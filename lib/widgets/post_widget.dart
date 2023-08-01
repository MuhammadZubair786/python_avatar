import 'package:flutter/material.dart';

import '../export_all.dart';

class PostWidget extends StatefulWidget {
  final postLists;
  const PostWidget({super.key, required this.postLists});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = widget.postLists[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/TrainerProfileScreen");
                      },
                      child: Container(
                        width: 47.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/Slicing/Android/4x/Rectangle 44.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      item.user!.fullName ?? '',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.more_horiz,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
              ],
            ),
            Container(
              width: 378.w,
              height: 278.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "assets/Slicing/Android/4x/Rectangle 30.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.08,
                ),
                Container(
                  child: Image(
                      image: AssetImage(
                          "assets/Slicing/Android/drawable-ldpi/Icon ionic-ios-heart.png")),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Text("50"),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Container(
                  child: Image(
                      image: AssetImage(
                          "assets/Slicing/Android/drawable-ldpi/Icon awesome-comment-dots.png")),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Text("50"),
                SizedBox(
                  width: Get.width * 0.6,
                ),
                InkWell(
                  onTap: () {
                    sharePopUp(context);
                  },
                  child: Container(
                    child: Image(
                        image: AssetImage(
                            "assets/Slicing/Android/drawable-ldpi/Icon awesome-share.png")),
                  ),
                ),
              ],
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return 20.verticalSpace;
      },
      itemCount: widget.postLists.length,
    );
  }
}
