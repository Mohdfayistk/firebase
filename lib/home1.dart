import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

TextEditingController controller = TextEditingController();
TextEditingController controller1 = TextEditingController();

class _home1State extends State<home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              'Email',
              style: TextStyle(
                color: Color(0xFF7C7C7C),
                fontSize: 16.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: TextFormField(
              style: TextStyle(
                color: Color(0xFF181725),
                fontSize: 18.sp,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.w400,
              ),
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child:
                Container(width: 364.w, height: 1.h, color: Color(0xffE2E2E2)),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              'Password',
              style: TextStyle(
                color: Color(0xFF7C7C7C),
                fontSize: 16.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: TextFormField(
              obscureText: true,
              style: TextStyle(
                color: Color(0xFF181725),
                fontSize: 18.sp,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.w400,
              ),
              controller: controller1,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child:
                Container(width: 364.w, height: 1.h, color: Color(0xffE2E2E2)),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              SizedBox(width: 80.w,),
              Container(
                width: 100.w,
                height: 30.h,
                color: Colors.white,
                child: Text(
                  'Google',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(width: 30.w,),
              Container(
                width: 100.w,
                height: 30.h,
                color: Colors.white,
                child: Text(
                  'Phone',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
