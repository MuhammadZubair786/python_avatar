import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:chatbot_app/constants/colors.dart';
class Accordion extends StatefulWidget {
  final String title;
  final List  content;


  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            border: Border.all(
                  width: 0.5,
                  color: Color(0xffD2D2D2)
                ),
            
          ),
          child: GestureDetector(
            onTap: (){
              
            },
            child: Column(
              children: [
              Container(
                padding: EdgeInsets.all(18.r),
                decoration: BoxDecoration(
                  borderRadius: _showContent == true ? BorderRadius.vertical(
                    top: Radius.circular(10.r),
          
                  ) : BorderRadius.circular(10.r),
                  
              gradient: kprimary,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 1)
                )
              ]
                ),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title,style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                        InkWell(
                          onTap: (){
                      //        setState(() {
                      //   _showContent = !_showContent;
                      // });
                          },
                          child: _showContent ? Icon(
                          Icons.arrow_drop_down ,
                          size: 33.r, color: Colors.white,): Icon(
                         Icons.arrow_drop_up ,
                         size: 33.r, color: Colors.white,) ,
                        ),
                        
                      ],
                    ),
              )
             ,
              _showContent
                  ? Container(
                      // padding:
                      //      EdgeInsets.symmetric(vertical: 5.r),
                      constraints: BoxConstraints(
                        maxHeight: Get.height * 0.3
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.content.length,
                        itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                        border: widget.content.length - index != 1? Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.grey.withOpacity(0.4)
                          )
                        ): null
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.content[index]['item'].toString(), style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp
                          ),),
                          Text(widget.content[index]['Quatity'].toString(), style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp
                          ),)
                        ],
                      ),
                    )
                  ],
                 ),),
                    )
                  : Container(),
                     
                     ]),
          ),
        ),
        Visibility(
            visible: _showContent,
            child: Column(
            children: [
               10.verticalSpace,
           Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.r,
              vertical: 17.r
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                width: 1,
                color: Color(0xffD2D2D2)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Kcal of meal 1:', style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold
                ),),
                Text('257', style: GoogleFonts.barlow(
                  color: Colors.black,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
           )
            ],
          ))
      ],
    );
  }
}