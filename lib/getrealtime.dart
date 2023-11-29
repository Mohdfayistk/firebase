import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class getrealtime extends StatefulWidget {
  const getrealtime({Key? key}) : super(key: key);

  @override
  State<getrealtime> createState() => _getrealtimeState();
}
final refDataInstance = FirebaseDatabase.instance.ref("post");

class _getrealtimeState extends State<getrealtime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, top: 150.h),
        child: FirebaseAnimatedList(

          query: refDataInstance,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) { return Container(
            width: 100.w,
            height: 80.h,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration:
            BoxDecoration(border: Border.all(color: Colors.brown, width: 3)),child: Text(snapshot.children.first.value.toString(),  style: TextStyle(
            color: Color(0xFF181725),
            fontSize: 32.sp,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w600,
          ),),
          ); },

        ),
      ),
    );
  }
}
