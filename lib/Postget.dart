import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class postget extends StatefulWidget {
  const postget({Key? key}) : super(key: key);

  @override
  State<postget> createState() => _postgetState();
}

final firestore = FirebaseFirestore.instance.collection('Post').snapshots();
final ref = FirebaseFirestore.instance.collection('Post');

class _postgetState extends State<postget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 25.w, top: 150.h),
            child: StreamBuilder<QuerySnapshot>(
                stream: firestore,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text(
                      'error',
                      style: TextStyle(color: Colors.purple),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: Text(
                                  snapshot.data!.docs[index]['title']
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.sp),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .doc(snapshot.data!.docs[index]['id']
                                          .toString())
                                      .delete();
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
                              SizedBox(
                                width: 10.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  dialogBox(
                                      index: index,
                                      id: snapshot.data!.docs[index].id
                                          .toString(),
                                      snapshot: snapshot);
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
                                      'Update',
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
                            ],
                          );
                        });
                  } else {
                    return Container();
                  }
                })));
  }

  Future<void> dialogBox(
      {required int index,
      required String id,
      required AsyncSnapshot<QuerySnapshot> snapshot}) async {
    final newValue = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Update',
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            content: TextFormField(
              controller: newValue,
            ),
            actions: [
              Row(
                children: [
                  GestureDetector(onTap: (){
                    ref
                        .doc(snapshot.data!.docs[index]['id'].toString())
                        .update({
                      'title': newValue.text,
                    }).then((value) {
                      ToastMessage()
                          .toastmessage(message: 'Updated Successfully');
                      Navigator.of(context).pop();
                    }).onError((error, stackTrace) {
                      ToastMessage().toastmessage(message: error.toString());
                    });
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
                          'update',
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
                ],
              ),
            ],
          );
        });
  }
}
