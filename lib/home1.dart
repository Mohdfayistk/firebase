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
      body: SingleChildScrollView(
        child: Column(
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
              child: Container(
                  width: 364.w, height: 1.h, color: Color(0xffE2E2E2)),
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
              child: Container(
                  width: 364.w, height: 1.h, color: Color(0xffE2E2E2)),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Container(
                width: 364.w,
                height: 67.h,
                decoration: ShapeDecoration(
                  color: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign up',
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
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 140.w,
                ),
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/1.png"),
                ),
                SizedBox(
                  width: 40.w,
                ),
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/2.png"),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
