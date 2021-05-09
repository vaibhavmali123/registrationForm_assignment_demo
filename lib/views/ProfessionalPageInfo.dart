import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registrationform_assignment/utils/ColorUtils.dart';
import 'package:registrationform_assignment/utils/StringsUtils.dart';
import 'package:intl/intl.dart';

class ProfessionalPageInfo extends StatefulWidget
{
  ProfessionalPageInfoState createState()=> ProfessionalPageInfoState();
}

class ProfessionalPageInfoState extends State<ProfessionalPageInfo>
{
  List<String>listEducation=['Post Graduate',
    'Graduate',
  'HSC/Diploma',
    'SSC'
  ];
  var selectedEducation;
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
          width:MediaQuery.of(context).size.width,
          child:
          Column(
            children: [
              getEducationalInfo(),
              SizedBox(height:14,),
              getProfessionalInfo()
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
                      icon:Icon(Icons.arrow_circle_down_rounded),
                      onChanged:(value){
                        setState(() {
                          selectedEducation=value;
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
                            color: Colors.black54,
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
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterYear,
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.2,color:Colors.black87)
                      )
                  ),
                ),
              ),
              SizedBox(height:5,),
              Text(StringsUtils.grade+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterPercent,
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.2,color:Colors.black87)
                      )
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
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  decoration:InputDecoration(
                      hintText:StringsUtils.enterExperience,
                      hintStyle:TextStyle(fontSize:14,
                          color:Colors.black38.withOpacity(0.2),fontWeight:FontWeight.w600,fontStyle:FontStyle.italic),
                      focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.6,color:Colors.black87)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(2.0),
                          borderSide:BorderSide(width:1.2,color:Colors.black87)
                      )
                  ),
                ),
              ),
              SizedBox(height:5,),
              Text(StringsUtils.designation+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
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
                        icon:Icon(Icons.arrow_circle_down_rounded),
                        onChanged:(value){
                          setState(() {
                            selectedEducation=value;
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
                          StringsUtils.enterDesignation,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(height:5,),
              Text(StringsUtils.domain+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
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
                        icon:Icon(Icons.arrow_circle_down_rounded),
                        onChanged:(value){
                          setState(() {
                            selectedEducation=value;
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
                          StringsUtils.enterDomain,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
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
                          Navigator.pushNamed(context,'/AddressPage');
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
}