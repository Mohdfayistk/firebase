import 'package:firebase/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

TextEditingController email = TextEditingController();
final auth = FirebaseAuth.instance;

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250.h,
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
              controller: email,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'enter email e.g fayis@gmail.com',
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
            height: 130.h,
          ),
          GestureDetector(
            onTap: () {
              auth.sendPasswordResetEmail(email: email.text).then((value) {
                ToastMessage()
                    .toastmessage(message: 'password changed successfully');
              }).onError((error, stackTrace) {
                ToastMessage().toastmessage(message: error.toString());
              });
            },
            child: Container(
              width: 250.w,
              height: 65.h,
              decoration: ShapeDecoration(
                color: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
              child: Center(
                child: Text(
                  'verify',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFF9FF),
                    fontSize: 20.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
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
