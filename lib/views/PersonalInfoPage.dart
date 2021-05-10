import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registrationform_assignment/Models/Users.dart';
import 'package:registrationform_assignment/blocs/UsersBloc.dart';
import 'package:registrationform_assignment/providers/InheritedDataProvider.dart';
import 'package:registrationform_assignment/utils/ColorUtils.dart';
import 'package:registrationform_assignment/utils/StringsUtils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registrationform_assignment/views/AddressPage.dart';
import 'package:registrationform_assignment/views/ProfessionalPageInfo.dart';

class PersonalInfoPage extends StatefulWidget{

  PersonalInfoPageState createState()=>PersonalInfoPageState();
}
enum GenderEnum{Male,Female}
enum FieldError { Empty, Invalid }

class PersonalInfoPageState extends State<PersonalInfoPage>
{
  var selectedGender;
final usersBloc=UsersBloc();
final fNameEditingCtrl=TextEditingController();
  final lNameEditingCtrl=TextEditingController();
  final mnoEditingCtrl=TextEditingController();
  final emailEditingCtrl=TextEditingController();
  final passwordEditingCtrl=TextEditingController();
  final confirmPasswordEditingCtrl=TextEditingController();
  final picker=ImagePicker();
  File image,croppedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor:Colors.white,
        centerTitle:true,
        elevation:0,
        leading:IconButton(icon:Icon(Icons.arrow_back),onPressed:(){
          Navigator.pop(context);
        },color:Colors.black87,),

        title:Text(StringsUtils.register,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:20,
            fontWeight:FontWeight.w800,color:Colors.black87)),),
      ),

      body:
      SingleChildScrollView(
        child:Container(
          color:Colors.white,
          width:MediaQuery.of(context).size.width,
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              getCicleAvatar(),
              getForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget getCicleAvatar() {

    return
      GestureDetector(
        onTap:(){
          _showPicker(context);
        },
        child:Stack(
          children: [
            CircleAvatar(
              radius:55,
              backgroundColor:Colors.white,
              child:CircleAvatar(
                backgroundColor:Colors.black87,
                radius:36,
                child:CircleAvatar(
                  radius:34,
                  backgroundColor:Colors.white,
                  child:Image.asset('assets/images/user_default.png'),
                ),
              ),
            ),
            Positioned(
                left:78,
                top:42,
                child:
                Container(
                  width:22,
                  height:22,
                  decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius:BorderRadius.circular(60.0),
                      border:Border.all(width:1,color:Colors.black87)
                  ),
                  child:Icon(Icons.edit,size:16,),
                )
            )
          ],
        ),
      );
  }

  Widget getForm() {
    return Container(
      width:MediaQuery.of(context).size.width/1.2,
      child:Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(StringsUtils.firstName+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  controller:fNameEditingCtrl,
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterFname,
                      prefixIcon:Icon(Icons.supervised_user_circle,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.4,color:Colors.black87)
                      )
                  ),
                ),
              ),
              SizedBox(height:10,),
              Text(StringsUtils.lastName+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  controller:lNameEditingCtrl,
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterLname,
                      prefixIcon:Icon(Icons.supervised_user_circle,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.4,color:Colors.black87)
                      )
                  ),
                ),
              ),

              SizedBox(height:10,),
              Text(StringsUtils.phoneNumber+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  controller:mnoEditingCtrl,
                  keyboardType:TextInputType.number,
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterPhoneNo,
                      prefixIcon:Icon(Icons.phone,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.4,color:Colors.black87)
                      )
                  ),
                ),
              ),
              SizedBox(height:10,),
              Text(StringsUtils.email+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  controller:emailEditingCtrl,
                  keyboardType:TextInputType.emailAddress,
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterEmail,
                      prefixIcon:Icon(Icons.email,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.4,color:Colors.black87)
                      )
                  ),
                ),
              ),
              SizedBox(height:10,),
              Text(StringsUtils.gender,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(
                      value:GenderEnum.Male,
                    groupValue:selectedGender,
                    onChanged:(value){
                        setState(() {
                          selectedGender=value;
                        });
                    },
                  ),
                  Text(StringsUtils.male,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                      color:Colors.black87))),
                  SizedBox(width: 40,),
                  Radio(
                    value:GenderEnum.Female,
                    groupValue:selectedGender,
                    onChanged:(value){
                      setState(() {
                        selectedGender=value;
                      });
                    },
                  ),
                  Text(StringsUtils.female,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                      color:Colors.black87))),
                ],
              ),
              SizedBox(height:5,),
              Text(StringsUtils.password+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  controller:passwordEditingCtrl,
                  decoration:InputDecoration(
                      hintText:StringsUtils.password,
                      prefixIcon:Icon(Icons.lock,color:Colors.black87,),
                      suffixIcon:IconButton(icon:Icon(Icons.visibility_off),
                          color:ColorUtils.colorConvert(ColorUtils.primaryColor),
                          onPressed:(){}),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.4,color:Colors.black87)
                      )
                  ),
                ),
              ),
              SizedBox(height:10,),
              Text(StringsUtils.confirmPassword+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  controller:confirmPasswordEditingCtrl,
                  decoration:InputDecoration(
                      hintText:StringsUtils.password,
                      prefixIcon:Icon(Icons.lock,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.4,color:Colors.black87)
                      )
                  ),
                ),
              ),
              SizedBox(height:20,),
              SizedBox(
                height:50,
                width:MediaQuery.of(context).size.width/1.2,
                child:RaisedButton(
                  shape:RoundedRectangleBorder(),
                  color:ColorUtils.colorConvert(ColorUtils.primaryColor),
                  child:Text(StringsUtils.next,style:GoogleFonts.notoSans(textStyle:
                  TextStyle(fontSize:16,height:2,
                      fontWeight:FontWeight.w700,color:Colors.white))),
                  onPressed:(){
                   final users=Users(fName:fNameEditingCtrl.text,
                       lName:lNameEditingCtrl.text,
                   email:emailEditingCtrl.text,mno:mnoEditingCtrl.text,
                   password:passwordEditingCtrl.text,gender:selectedGender.toString());
                   /*if (users.fName.isNotEmpty) {
                     usersBloc.addUsers(users);
                   } */
                   Navigator.of(context).push(MaterialPageRoute(builder:(context){
                     return ProfessionalPageInfo(users:users,);
                   }));
                    // Navigator.pushNamed(context,'/ProfessionaInfoPage');
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future getImageFromCamera() async{
    final pickedFile=await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile!=null){
        image = File(pickedFile.path);
        _cropImage();

        croppedImage=image;
      }
    });
  }


  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Future getImageFromGallery() async{
    final pickedFile=await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile!=null){
        image = File(pickedFile.path);
        _cropImage();
        croppedImage=image;
      }
    });
  }

  Future<Null> _cropImage() async{
    File croppedFile=await ImageCropper.cropImage(
        sourcePath:image.path,
        cropStyle:CropStyle.circle,
        maxWidth:200,
        maxHeight:200,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor:ColorUtils.colorConvert(ColorUtils.primaryColor),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio5x4,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      setState(() {
        croppedImage = croppedFile;
        // uploadImage("ShubhamLarotiImage","https://xy2y3lhble.execute-api.ap-south-1.amazonaws.com/dev");
      });
    }
  }
}