import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registrationform_assignment/utils/StringsUtils.dart';

class ProfessionalPageInfo extends StatefulWidget
{
  ProfessionalPageInfoState createState()=> ProfessionalPageInfoState();
}

class ProfessionalPageInfoState extends State<ProfessionalPageInfo>
{
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

        ),
      ),
    );
     }
}