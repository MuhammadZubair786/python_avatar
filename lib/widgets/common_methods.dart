import 'package:flutter/material.dart';

import '../export_all.dart';

Future sharePopUp(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          width: 356.w,
          height: 310.h,
          padding: EdgeInsets.symmetric(vertical: 35.r, horizontal: 33.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Share',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.r,
                          height: 50.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF4F5F8),
                              border: Border.all(
                                  width: 1, color: Color(0xffCECECE))),
                          child: SvgPicture.asset(
                            'assets/Slicing/Icon awesome-facebook-f.svg',
                            width: 14.r,
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          'Facebook',
                          style: TextStyle(
                              color: Color(0xff333333), fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.r,
                          height: 50.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF4F5F8),
                              border: Border.all(
                                  width: 1, color: Color(0xffCECECE))),
                          child: SvgPicture.asset(
                            'assets/Slicing/Icon awesome-twitter.svg',
                            width: 24.r,
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          'Twitter',
                          style: TextStyle(
                              color: Color(0xff333333), fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.r,
                          height: 50.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF4F5F8),
                              border: Border.all(
                                  width: 1, color: Color(0xffCECECE))),
                          child: SvgPicture.asset(
                            'assets/Slicing/Icon zocial-linkedin.svg',
                            width: 21.r,
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          'Linkedin',
                          style: TextStyle(
                              color: Color(0xff333333), fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.r,
                          height: 50.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF4F5F8),
                              border: Border.all(
                                  width: 1, color: Color(0xffCECECE))),
                          child: SvgPicture.asset(
                            'assets/Slicing/Icon simple-google.svg',
                            width: 23.r,
                          ),
                        ),
                        10.verticalSpace,
                        Text('Google',
                            style: TextStyle(
                                color: Color(0xff333333), fontSize: 14.sp))
                      ],
                    ),
                  )
                ],
              ),
              Text(
                'Page Link',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                // height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 17.r),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffF4F5F8),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(width: 1, color: Color(0xffCECECE))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      'https://www.facebook.com/abcdef',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.sp),
                    )),
                    SvgPicture.asset(
                      'assets/Slicing/Icon open-external-link.svg',
                      width: 18.r,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
