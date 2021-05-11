import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registrationform_assignment/Models/Users.dart';
import 'package:registrationform_assignment/utils/ColorUtils.dart';
import 'package:registrationform_assignment/utils/StringsUtils.dart';
import 'package:intl/intl.dart';
import 'package:registrationform_assignment/views/AddressPage.dart';

class ProfessionalPageInfo extends StatefulWidget
{
  Users users=Users();

  ProfessionalPageInfo({this.users});

  ProfessionalPageInfoState createState()=> ProfessionalPageInfoState(users:users);
}
enum Fields{YearOfPass,Grade,Experience,Designation,Domain}

class ProfessionalPageInfoState extends State<ProfessionalPageInfo>
{
  Users users=Users();
  final yearPassingEditingController=TextEditingController();
  final gradeEditingController=TextEditingController();
  final designationEditingController=TextEditingController();
  final experienceEditingController=TextEditingController();
  final domainEditingController=TextEditingController();

  ProfessionalPageInfoState({this.users});

  List<String>listEducation=['Post Graduate',
    'Graduate',
  'HSC/Diploma',
    'SSC'
  ];
  var selectedEducation;
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

        title:Text(StringsUtils.yourInfo,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:20,
            fontWeight:FontWeight.w800,color:Colors.black87)),),
      ),
      body:SingleChildScrollView(
        child:Container(
          color:Colors.white,
          width:MediaQuery.of(context).size.width,
          child:
          Column(
            children: [
              Form(
                  key:_formKey,
                  autovalidate:autoValidate,
                  child:Column(
                    children: [
                      getEducationalInfo(),
                      getProfessionalInfo()
                    ],
                  ))
            ],
          )
        ),
      ),
    );
     }

  Widget getEducationalInfo() {
    return Container(
      width:MediaQuery.of(context).size.width/1.2,
      child:Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(StringsUtils.eduInfo,style:GoogleFonts.notoSans(textStyle:
              TextStyle(fontSize:16,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:5,),
              Text(StringsUtils.education+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              Container(
                height: 54,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    border: Border.all(width:1.2, color: Colors.black87)),
                child: Center(
                  child:
                  Theme(
                    data:Theme.of(context).copyWith(
                      canvasColor:Colors.white,
                      buttonTheme:ButtonTheme.of(context).copyWith(
                          alignedDropdown:true,
                      )
                    ),
                    child:DropdownButton<String>(
                      value:selectedEducation,
                      underline: Container(
                        height: 1.0,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                BorderSide(color: Colors.transparent, width: 0.0))),
                      ),
                      isExpanded: true,
                      focusColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      icon:Image.asset('assets/images/sort-down.png',height:22,width:18,),
                      onChanged:(value){
                        setState(() {
                          selectedEducation=value;
                          FocusScope.of(context).requestFocus(new FocusNode());
                        });
                      },
                      items:listEducation
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.black87, fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        StringsUtils.eduInfo,
                        style: TextStyle(
                            fontSize: 14,
                            color:autoValidate==true && selectedEducation==null?Colors.red:Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(height:5,),
              Text(StringsUtils.yearPassing+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:yearPassingEditingController,
                  keyboardType:TextInputType.number,
                  inputFormatters:<TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator:(arg)=>validateField(arg:arg,fields:Fields.YearOfPass),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterYear,
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                      helperText:' ',
                      errorBorder:errorBorder,
                    focusedErrorBorder:errorBorder
                  ),
                ),
              ),
              Text(StringsUtils.grade+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:gradeEditingController,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Grade),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterPercent,
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                      helperText:' ',
                      errorBorder:errorBorder,
                      focusedErrorBorder:errorBorder
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

  Widget getProfessionalInfo() {
    return Container(
      width:MediaQuery.of(context).size.width/1.2,
      child:Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(StringsUtils.professionalInfo,style:GoogleFonts.notoSans(textStyle:
              TextStyle(fontSize:16,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              Text(StringsUtils.experience+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:experienceEditingController,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Experience),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterExperience,
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                      errorBorder:errorBorder,
                      helperText:' ',
                      focusedErrorBorder:errorBorder
                  ),
                ),
              ),
              SizedBox(height:5,),
              Text(StringsUtils.designation+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:designationEditingController,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Designation),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterDesignation,
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
              SizedBox(height:5,),
              Text(StringsUtils.domain+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:80,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextFormField(
                  controller:domainEditingController,
                  validator:(arg)=>validateField(arg:arg,fields:Fields.Domain),
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterDomain,
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:focusedBorder,
                      enabledBorder:enabledBorder,
                      helperText:' ',
                      errorBorder:errorBorder,
                      focusedErrorBorder:errorBorder
                  ),
                ),
              ),
              SizedBox(height:14,),
              Container(
                width:MediaQuery.of(context).size.width/1.2,
                child:Row(

                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height:50,
                      width:MediaQuery.of(context).size.width/2.5,
                      child:
                      GestureDetector(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child:Container(
                            decoration:BoxDecoration(
                                border:Border.all(width:1.4,color:ColorUtils.colorConvert(ColorUtils.primaryColor))
                            ),
                            child:Center(
                              child:Text(StringsUtils.previous,style:GoogleFonts.notoSans(textStyle:
                              TextStyle(fontSize:16,height:2,
                                  fontWeight:FontWeight.w700,color:ColorUtils.colorConvert(ColorUtils.primaryColor)))),
                            )
                        ),
                      )
                    ),
                    SizedBox(
                      height:50,
                      width:MediaQuery.of(context).size.width/2.5,
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
                          if (selectedEducation!=null && yearPassingEditingController.text.length>0 &&
                          gradeEditingController.text.length>0 && experienceEditingController.text.length>0 &&
                          designationEditingController.text.length>0 && domainEditingController.text.length>0) {
                            addDataAndNavigate();
                            print("selectedEducation ${selectedEducation}");
                          }
                          //Navigator.pushNamed(context,'/AddressPage');
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
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

  validateField({String arg, Fields fields})
  {
    switch(fields){
      case Fields.YearOfPass:
        if (arg.length<=0) {
          return 'Year of passing should not empty';
        }
        else{
          return null;
        }
        break;
      case Fields.Grade:
        if (arg.length<=0) {
          return 'Grade should not empty';
        }
        else{
          return null;
        }
        break;
      case Fields.Experience:
        if (arg.length<=0) {
          return 'Experience should not empty';
        }
        else{
          return null;
        }
        break;
      case Fields.Designation:
        if (arg.length<=0) {
          return 'Designation should not empty';
        }
        else{
          return null;
        }
        break;
      case Fields.Domain:
        if (arg.length<=0) {
          return 'Domain should not empty';
        }
        else{
          return null;
        }
        break;

  }
}

  void addDataAndNavigate() {
    users.eduInfo=selectedEducation.toString();
    users.yearOfPass=yearPassingEditingController.text;
    users.grade=gradeEditingController.text;
    users.experience=experienceEditingController.text.toString();
    users.designation=designationEditingController.text;
    users.domain=domainEditingController.text.toString();
    Navigator.of(context).push(MaterialPageRoute(
        builder:(context){
          return AddressPage(users:users,);
        }
    ));
  }
}