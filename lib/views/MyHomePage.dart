import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registrationform_assignment/Models/Users.dart';
import 'package:registrationform_assignment/blocs/UsersBloc.dart';
import 'package:registrationform_assignment/utils/ColorUtils.dart';
import 'package:registrationform_assignment/utils/StringsUtils.dart';

class MyHomePage extends StatefulWidget
{
  MyHomePageState createState()=> MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
{
  final usersBloc=UsersBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeStatusBarColor();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar:AppBar(
          backgroundColor:Colors.white,
          elevation:0,
          title:Text(StringsUtils.users,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:20,
          fontWeight:FontWeight.w800,color:Colors.black87)),),
          centerTitle:true,
        ),
        bottomNavigationBar:
        getRegisterButton(),
        body:Container(
          color:Colors.white,
          child:getData()
        ),
      );
  }




  getData() {
    return StreamBuilder(
        stream:usersBloc.usersList,
        builder:(context,AsyncSnapshot<List<Users>> snapshot){
          if (snapshot.hasData) {
            return
              snapshot.data.length>0?ListView.builder(
                  itemCount:snapshot.data.length,
                  itemBuilder:(context,index){
                    return
                      GestureDetector(
                        onTap:()=>displayDialog(snapshot.data[index]),
                        child:Column(
                          children: [
                            Container(
                              height:90,
                               color:Colors.white,
                               margin:EdgeInsets.only(left:5),
                              child:Row(
                                children: [
                                  Expanded(
                                    flex:1,
                                    child:snapshot.data[index].profileUrl!=null?
                                    ClipOval(child:Image.file(File(snapshot.data[index].profileUrl)),)
                                        :Icon(Icons.account_circle,size:60,),
                                  ),
                                  Expanded(
                                      flex:4,
                                      child:Column(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          Text(snapshot.data[index].fName+" "+snapshot.data[index].lName,
                                            style:TextStyle(fontSize:16,color:Colors.black87,fontWeight:FontWeight.w700),),
                                          SizedBox(height:5,),
                                          Text(snapshot.data[index].address+" "+snapshot.data[index].city)
                                        ],
                                      )),
                                  Expanded(
                                    flex:1,
                                    child:SvgPicture.asset('assets/images/right-arrow.svg',
                                      color:Colors.black54,width:50,height:20,),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              color:Colors.black38,
                              width:MediaQuery.of(context).size.width,
                              height:1,
                            )
                          ],
                        ),
                      );
                  }):Center(
                child:Text(StringsUtils.noData),
              );
          }
          return CircularProgressIndicator();
    });
  }



  getRegisterButton() {
    return SizedBox(
      width:MediaQuery.of(context).size.width,
      height:55,
      child:RaisedButton(
          color:ColorUtils.colorConvert(ColorUtils.primaryColor).withOpacity(1),
          child:Text(StringsUtils.register,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
              fontWeight:FontWeight.w600,color:Colors.white)),),
          onPressed:(){
            Navigator.pushNamed(context,'/PersonalInfoPage');
          }),
    );
  }

  void changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor:Colors.white
        )
    );
  }

  displayDialog(Users users) {
   showGeneralDialog(
    context:context,
    barrierDismissible:true,
       barrierLabel: MaterialLocalizations.of(context)
           .modalBarrierDismissLabel,
       barrierColor: Colors.black45,
       transitionDuration: const Duration(milliseconds: 200),
       pageBuilder: (BuildContext buildContext,
           Animation animation,
           Animation secondaryAnimation){
          return
            Padding(padding:EdgeInsets.only(left:20,right:20,top:MediaQuery.of(context).size.height/6,bottom:MediaQuery.of(context).size.height/10),
            child:
            Material(
              child:Container(
                width:MediaQuery.of(context).size.width-100,
                height:MediaQuery.of(context).size.height/1.2,
                color:Colors.white,
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        Container(
                          width:22,
                          height:22,
                          margin:EdgeInsets.all(14),
                          decoration:BoxDecoration(
                              shape:BoxShape.circle,
                              border:Border.all(width:1,color:Colors.black54)
                          ),
                          child:GestureDetector(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child:Icon(Icons.clear,size:20,),
                          ),
                        )
                      ],
                    ),
                    getHorizantalLine(),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex:7,
                          child:
                          Container(
                            margin:EdgeInsets.only(left:8,top:12),
                            child:Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(StringsUtils.basicInfo,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:16,
                                    fontWeight:FontWeight.w800,color:Colors.black87)),),
                            users.profileUrl!=null?ClipOval(child:Image.file(File(users.profileUrl,),width:65,height:65,),)
                                :Icon(Icons.account_circle,size:60,),
                                Text(users.email,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:12,
                                    fontWeight:FontWeight.w400,color:ColorUtils.colorConvert(ColorUtils.primaryColor))),),
                                SizedBox(height:2,),
                                Text(users.mno,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:15,
                                    fontWeight:FontWeight.w400,color:ColorUtils.colorConvert(ColorUtils.primaryColor))),),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                            flex:8,
                            child:Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment:MainAxisAlignment.start,
                              children: [
                                Text(users.fName +" "+users.lName,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:16,
                                    fontWeight:FontWeight.w800,color:Colors.black87)),),
                                    SizedBox(height:6,),
                                Text(users.designation,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:15,
                                    fontWeight:FontWeight.w600,color:Colors.cyan)),),
                                SizedBox(height:6,),

                                Text(users.address +" "+users.city+" ",maxLines:4,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                                    color:Colors.black87)),),
                                SizedBox(height:2,),

                                Text(users.landmark,maxLines:4,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                                    color:Colors.black87)),),
                                SizedBox(height:2,),
                                Text(users.state,maxLines:4,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                                    color:Colors.black87)),),
                                SizedBox(height:2,),
                                Text(users.pincode,maxLines:4,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                                    color:Colors.black87)),),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(height:15,),
                    getHorizantalLine(),
                    SizedBox(height:5,),
                    Container(
                      margin:EdgeInsets.only(left:12),
                      child:Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                          SizedBox(height:12,),
                          Text(StringsUtils.eduInfo,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:16,
                              fontWeight:FontWeight.w800,color:Colors.black87)),),
                          SizedBox(height:2,),

                          Text(users.eduInfo,maxLines:4,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                              color:Colors.black87)),),
                          SizedBox(height:2,),
                          Text('Passing Year-'+users.yearOfPass,maxLines:4,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                              color:Colors.black87)),),
                          SizedBox(height:2,),
                          Text(users.grade,maxLines:4,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                              color:Colors.black87)),),
                          SizedBox(height:15,),

                          getHorizantalLine(),
                          SizedBox(height:15,),
                          Text(StringsUtils.professionalInfo,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:16,
                              fontWeight:FontWeight.w800,color:Colors.black87)),),
                          SizedBox(height:2,),
                          Text(users.experience+' Years of experience',style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                              color:Colors.black87)),),
                          SizedBox(height:2,),
                          Text("Designation: "+users.domain,style:GoogleFonts.notoSans(textStyle:TextStyle(fontSize:14,
                              color:Colors.black87)),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            );
       }
   );
  }

  getHorizantalLine() {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Container(
          // margin:EdgeInsets.only(top:26),
          width:MediaQuery.of(context).size.width/1.2,
          color:Colors.black54,
          height:1,
        )
      ],
    );
  }
}