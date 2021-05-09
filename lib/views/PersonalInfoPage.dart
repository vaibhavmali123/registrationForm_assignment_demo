import 'package:flutter/material.dart';
import 'package:registrationform_assignment/utils/ColorUtils.dart';
import 'package:registrationform_assignment/utils/StringsUtils.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoPage extends StatefulWidget{

  PersonalInfoPageState createState()=>PersonalInfoPageState();
}

class PersonalInfoPageState extends State<PersonalInfoPage>
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

        title:Text(StringsUtils.register,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:20,
            fontWeight:FontWeight.w800,color:Colors.black87)),),
      ),

      body:
      SingleChildScrollView(
        child:Container(
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
    return Stack(
      children: [
        Container(
          width:100,
          decoration:BoxDecoration(
            shape:BoxShape.circle,
            border:Border.all(width:2,color:Colors.black38),
          ),
          child:CircleAvatar(
            radius:50,
            backgroundColor:Colors.white,
            child:Center(
              child:Icon(Icons.account_circle_sharp,size:100,color:Colors.black38,),
            ),
          ),
        ),
        Positioned(
            right:0,
            left:85,
            top:0,
            child:Container(
              width:100,
              height:100,
              decoration:BoxDecoration(
                  shape:BoxShape.circle,
                  border:Border.all(width:1,color:Colors.black45)
              ),
              child:Center(
                child:IconButton(icon:Icon(Icons.edit,size:20,),
                    onPressed:(){}),
              ),
            )
        )
      ],
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
              Text(StringsUtils.password+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  decoration:InputDecoration(
                      hintText:StringsUtils.password,
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
              Text(StringsUtils.confirmPassword+'*',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,height:2,
                  fontWeight:FontWeight.w700,color:Colors.black87))),
              SizedBox(height:4,),
              SizedBox(
                height:55,
                width:MediaQuery.of(context).size.width/1.2,
                child:TextField(
                  decoration:InputDecoration(
                      hintText:StringsUtils.password,
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
                    Navigator.pushNamed(context,'/ProfessionaInfoPage');
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}