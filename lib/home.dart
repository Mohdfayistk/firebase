import 'package:firebase/home1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

TextEditingController controller = TextEditingController();
TextEditingController controller1 = TextEditingController();

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    'Log In',
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
             SizedBox(height: 25.h,),
             Center(
               child: GestureDetector(onTap: () {
                 Navigator.of(context)
                     .push(MaterialPageRoute(builder: (_) => home1()));
               },
                 child: SizedBox(width: 250.w,height: 30.h,
                   child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            color: Color(0xFF181725),
                            fontSize: 14,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                            letterSpacing: 0.70,
                          ),
                        ),
                        TextSpan(
                          text: 'Singup',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 14,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                            letterSpacing: 0.70,
                          ),
                        ),
                      ],
                    ),
            ),
                 ),
               ),
             ),
            SizedBox(height: 50.h,)
          ],
        ),
      ),
    );
  }
}
