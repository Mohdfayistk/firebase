import 'dart:io';

import 'package:firebase/toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
class Imageupload extends StatefulWidget {
  const Imageupload({Key? key}) : super(key: key);

  @override
  State<Imageupload> createState() => _ImageuploadState();
}
final ImagePicker picker = ImagePicker();
File? _image;
firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage
    .instance;
DatabaseReference databaseReference = FirebaseDatabase.instance.ref('post');
class _ImageuploadState extends State<Imageupload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 150.h,),
      Padding(
        padding:  EdgeInsets.only(left: 30.w),
        child: Container(
          width: 320.w,
          height: 380.h,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.brown, width: 3)),child: _image==null?SizedBox():Image.file(_image!.absolute),
        ),
      ),
    SizedBox(height: 30.h,),
    Row(
      children: [
        SizedBox(width: 30.w,),
        Container(
          width: 90.w,
          height: 40.h,
          decoration: ShapeDecoration(
            color: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          child: Center(
            child: GestureDetector(onTap: (){
              getGalleryImage().then((value) => {
                ToastMessage()
                    .toastmessage(message: 'success')
              })
                  .onError((error, stackTrace) => ToastMessage()
                  .toastmessage(message: error.toString()));
            },
              child: Text(
                'Gallery',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFF9FF),
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 25.w,),
        GestureDetector(onTap: ()async{
          final id=DateTime.now().microsecondsSinceEpoch.toString();
          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance.ref('/foldername/' + id);
          firebase_storage.UploadTask uploadtask=ref.putFile(_image!.absolute);
          await Future.value(uploadtask).then((value)async{
            var newUrl= await ref.getDownloadURL();
            print(newUrl.toString());
            databaseReference.child(id).set({
              'id':id,
              'title':newUrl.toString()
            }).then((value) => ToastMessage().toastmessage(message: 'Uploaded'));
          });
        },
          child: Container(
            width: 120.w,
            height: 60.h,
            decoration: ShapeDecoration(
              color: Colors.brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                'Upload',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFF9FF),
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 25.w,),
        GestureDetector(onTap: (){
          getCamera().then((value) => {
            ToastMessage()
                .toastmessage(message: 'success')
          })
              .onError((error, stackTrace) => ToastMessage()
              .toastmessage(message: error.toString()));
        },
          child: Container(
            width: 90.w,
            height: 40.h,
            decoration: ShapeDecoration(
              color: Colors.brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Center(
              child: Text(
                'Camera',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFF9FF),
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ],
),
    );
  }

  Future<void> getGalleryImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }

  Future<void> getCamera() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }
}
