import 'package:firebase/toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Postget.dart';

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
            height: 130.h,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration:
            BoxDecoration(border: Border.all(color: Colors.brown, width: 3)),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.children.first.value.toString(),  style: TextStyle(
                color: Color(0xFF181725),
                fontSize: 32.sp,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.w600,
          ),),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    SizedBox(width: 50.w,),
                    GestureDetector(onTap: (){
                      ref
                          .doc(snapshot.value.toString())
                          .delete().then((value) => {ToastMessage().toastmessage(message: 'Deleted')})
                          .onError((error, stackTrace) =>
                          ToastMessage().toastmessage(message: error.toString()));

                    },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: ShapeDecoration(
                          color: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Delete',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFFF9FF),
                              fontSize: 12.sp,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: ShapeDecoration(
                        color: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Delete',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFFF9FF),
                            fontSize: 12.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ); },

        ),
      ),
    );
  }
}
