import 'package:firebase/Imageupload.dart';
import 'package:firebase/sign%20in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
    SizedBox(height: 120.h),
    Padding(
      padding:  EdgeInsets.only(left: 30.w),
      child: GestureDetector(onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => signin()));
      },
        child: Container(
          width: 250.w,
          height: 67.h,
          decoration: ShapeDecoration(
            color: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          child: Center(
            child: Text(
              'sign in',
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
    ),
    SizedBox(height: 50.h,),
    Padding(
      padding:  EdgeInsets.only(left: 30.w),
      child: GestureDetector(onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Imageupload()));
      },
        child: Container(
          width: 250.w,
          height: 67.h,
          decoration: ShapeDecoration(
            color: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          child: Center(
            child: Text(
              'Image upload',
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
    ),

  ],
),
    );
  }
}
