import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

TextEditingController text = TextEditingController();

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
        SizedBox(height: 120.h,),
      Center(
        child: Container(width: 300.w, height: 250.h,
            margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.brown, width: 3)),
        child: TextFormField(
          style: TextStyle(
            color: Color(0xFF181725),
            fontSize: 32.sp,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w600,
          ),
          controller: text,
          autofocus: true,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    ),
          SizedBox(height: 50.h,),
          Center(
            child: Container(
              width: 320.w,
              height: 67.h,
              decoration: ShapeDecoration(
                color: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
              child: Center(
                child: Text(
                  'Post',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFF9FF),
                    fontSize: 18.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
    ]
    )
    ,
    );
  }
}
