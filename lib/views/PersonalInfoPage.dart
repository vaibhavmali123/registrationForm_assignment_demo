import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
enum Fields{Fname,lname,Mno,Email,Gender,Password,ConfirmPassord}

class PersonalInfoPageState extends State<PersonalInfoPage>
{
  var selectedGender;
  bool isValidate=false,isEmailValid,ispasswordValid,isConfirmPassword,isVisible=false;
final usersBloc=UsersBloc();
final fNameEditingCtrl=TextEditingController();
  final lNameEditingCtrl=TextEditingController();
  final mnoEditingCtrl=TextEditingController();
  final emailEditingCtrl=TextEditingController();
  final passwordEditingCtrl=TextEditingController();
  final confirmPasswordEditingCtrl=TextEditingController();
  final picker=ImagePicker();
  File image,croppedImage;

  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  bool autoValidate=false;

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
              Form(
                  key:_formKey,
                  autovalidate:autoValidate,
                  child:getForm())
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
                  child:croppedImage==null?
                  Image.asset('assets/images/user_default.png'):ClipOval(
                    child:Image.file(File(croppedImage.path)),
                  ),
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
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:fNameEditingCtrl,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Fname),
                  inputFormatters:<TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[a-z]')),
                  ],
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterFname,
                      helperText:'',
                      prefixIcon:Icon(Icons.supervised_user_circle,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                     focusedErrorBorder:errorBorder,
                      errorBorder:errorBorder,
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder
                  ),
                ),
              ),

              SizedBox(height:10,),
              Text(StringsUtils.lastName+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:lNameEditingCtrl,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.lname),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterLname,
                      helperText:' ',
                      prefixIcon:Icon(Icons.supervised_user_circle,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                    focusedErrorBorder:errorBorder,
                    errorBorder:errorBorder
                  ),
                ),
              ),

              SizedBox(height:10,),
              Text(StringsUtils.phoneNumber+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:mnoEditingCtrl,
                  keyboardType:TextInputType.number,
                  inputFormatters:<TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  maxLength:10,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Mno),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterPhoneNo,
                      prefixIcon:Icon(Icons.phone,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                    errorBorder:errorBorder,
                    focusedErrorBorder:errorBorder,
                    helperText:' '
                  ),
                ),
              ),
              SizedBox(height:10,),
              Text(StringsUtils.email+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:emailEditingCtrl,
                  keyboardType:TextInputType.emailAddress,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Email),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterEmail,
                      prefixIcon:Icon(Icons.email,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                    errorBorder:errorBorder,
                    focusedErrorBorder:errorBorder,
                    helperText:' '
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
                      color:selectedGender==null && autoValidate==true?Colors.red:Colors.black87))),
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
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:passwordEditingCtrl,
                  obscureText:isVisible==false?true:false,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Password),
                  decoration:InputDecoration(
                      hintText:StringsUtils.password,
                      prefixIcon:Icon(Icons.lock,color:Colors.black87,),
                      suffixIcon:IconButton(icon:Icon(isVisible==false?Icons.visibility_off:Icons.visibility_outlined),
                          color:ColorUtils.colorConvert(ColorUtils.primaryColor),
                          onPressed:(){
                          setState(() {
                            isVisible==false?isVisible=true:isVisible=false;
                          });
                          }),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                    errorBorder:errorBorder,
                    focusedErrorBorder:errorBorder,
                    helperText:' '
                  ),
                ),
              ),
              SizedBox(height:10,),
              Text(StringsUtils.confirmPassword+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:confirmPasswordEditingCtrl,
                  obscureText:true,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Password),
                  decoration:InputDecoration(
                      hintText:StringsUtils.password,
                      prefixIcon:Icon(Icons.lock,color:Colors.black87,),
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      helperText:' ',
                      enabledBorder:enabledBorder,
                      errorBorder:errorBorder,
                    focusedErrorBorder:errorBorder
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
                   if (_formKey.currentState.validate()) {
                     _formKey.currentState.save();
                     setState(() {
                       autoValidate = true;
                     });
                   }
                   if (fNameEditingCtrl.text.length>3 && lNameEditingCtrl.text.length>3 && mnoEditingCtrl.text.length>0
                   &&isEmailValid==true && ispasswordValid==true && isConfirmPassword==true) {
                     addDataAndNavigate();
                   }
                   print("VALIDATE ${_formKey.currentState}");

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

  void addDataAndNavigate() {
    final users=Users(fName:fNameEditingCtrl.text,
        lName:lNameEditingCtrl.text,
        email:emailEditingCtrl.text,mno:mnoEditingCtrl.text,
        password:passwordEditingCtrl.text,gender:selectedGender.toString(),);
    if (croppedImage!=null) {
      users.profileUrl=croppedImage.path;
    }


    Navigator.of(context).push(MaterialPageRoute(builder:(context){
      return ProfessionalPageInfo(users:users,);
    }));
  }

  validateField({String arg,Fields fields})
  {
    switch(fields){
      case Fields.Fname:
        if (arg.length<=3) {
          return 'First name should more than 3 characters';
        }
        else{
          isValidate=true;
          return null;
        }
        break;
      case Fields.lname:
        if (arg.length<=3) {
          return 'Last name should more than 3 characters';
        }
        else{
          isValidate=true;
          return null;
        }
        break;
      case Fields.Email:
        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(arg)==false) {
          return 'Invalid email';
        }
        else{
          isEmailValid=true;
          isValidate=true;
          return null;
        }
        break;
      case Fields.Mno:
        if (arg.length<10) {
          return 'Invalid Phone Number';
        }
        else{
          isValidate=true;
          return null;
        }
        break;
      case Fields.Password:

        if (passwordEditingCtrl.text==confirmPasswordEditingCtrl.text) {
          isConfirmPassword=true;

          if (arg.contains(RegExp(r'\W')) && RegExp(r'\d+\w*').hasMatch(arg)) {
            ispasswordValid=true;
            return null;
          }
          else{
            return 'Password should be 1 number,character & symbols';
          }
         }
         else{
          isConfirmPassword=false;

           return 'Password & confirm password dosent match';
         }
        break;
      default:
        {
          print("default");
        }
        break;
    }
  }
  var errorBorder=OutlineInputBorder(
  borderRadius:BorderRadius.circular(2.0),
  borderSide:BorderSide(width:1.6,color:Colors.red));

  var focusedBorder=OutlineInputBorder(
      borderRadius:BorderRadius.circular(2.0),
      borderSide:BorderSide(width:1.6,color:Colors.black87)
  );
  var enabledBorder=OutlineInputBorder(
      borderRadius:BorderRadius.circular(2.0),
      borderSide:BorderSide(width:1.4,color:Colors.black87)
  );
}