import 'package:firebase/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firestore.dart';
class otpverification extends StatefulWidget {
   final   String  vericationid;
  const otpverification({Key? key,required this.vericationid}) : super(key: key);

  @override
  State<otpverification> createState() => _otpverificationState();
}
FirebaseAuth auth = FirebaseAuth.instance;
class _otpverificationState extends State<otpverification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.h,),
          Padding(
            padding:  EdgeInsets.only(left: 80.w),
            child: Text('verification code',
                style: TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 32.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,)),
          ),
          SizedBox(height: 50.h,),
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode)async{
              final credentials = PhoneAuthProvider.credential(
                  verificationId: widget.vericationid,
                  smsCode:verificationCode );
              try{
                await auth.signInWithCredential(credentials);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>home()));
              }catch(e){
                ToastMessage().toastmessage(message: e.toString());
              }
            }, // end onSubmit
          ),
          SizedBox(height: 80.h,),
          
        ],
      ),
    );
  }
}
