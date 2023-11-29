import 'package:firebase/getrealtime.dart';
import 'package:firebase/toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class realtime extends StatefulWidget {
  const realtime({Key? key}) : super(key: key);

  @override
  State<realtime> createState() => _realtimeState();
}

final refDataInstance = FirebaseDatabase.instance.reference().child('post');
TextEditingController text1 = TextEditingController();

class _realtimeState extends State<realtime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.h,
          ),
          Center(
            child: Container(
              width: 300.w,
              height: 250.h,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown, width: 3)),
              child: TextFormField(
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                  color: Color(0xFF181725),
                  fontSize: 32.sp,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w600,
                ),
                controller: text1,
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                refDataInstance
                    .push()
                    .child('post')
                    .set(text1.text)
                    .then((value) =>
                        {ToastMessage().toastmessage(message: 'Post Added')})
                    .onError((error, stackTrace) =>
                        ToastMessage().toastmessage(message: error.toString()));
              },
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
          ),
          SizedBox(
            height: 80.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => getrealtime()));
              },
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
                    'get',
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
