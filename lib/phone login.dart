import 'package:firebase/otp%20verification.dart';
import 'package:firebase/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class phonelogin extends StatefulWidget {
  const phonelogin({Key? key}) : super(key: key);

  @override
  State<phonelogin> createState() => _phoneloginState();
}

TextEditingController mobilenumber = TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;
class _phoneloginState extends State<phonelogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Text(
              'Mobile number',
              style: TextStyle(
                color: Color(0xFF7C7C7C),
                fontSize: 32.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(
                color: Color(0xFF181725),
                fontSize: 20.sp,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.w400,
              ),
              controller: mobilenumber,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixText: ('+91'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child:
                Container(width: 300.w, height: 1.h, color: Color(0xffE2E2E2)),
          ),
          SizedBox(height: 70.h,),
          Padding(
            padding:  EdgeInsets.only(left: 80.w),
            child: GestureDetector(onTap: (){
              auth.verifyPhoneNumber(phoneNumber: "+91${mobilenumber.text}",verificationCompleted: (_){},
                  verificationFailed: (e){
                    ToastMessage().toastmessage(message: e.toString());
                  },
                  codeSent: (String verificationId,int? token){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>otpverification(vericationid: verificationId,)));

                  },
                  codeAutoRetrievalTimeout: (e){
                    ToastMessage().toastmessage(message: e.toString());
                  });
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
                    'Get OTP',
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
