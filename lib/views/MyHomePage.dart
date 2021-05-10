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
                      Column(
                        children: [
                          Container(
                            height:90,
                            // margin:EdgeInsets.only(top:25),
                            child:Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child:Icon(Icons.account_circle,size:60,),
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
                      );
                  }):Center(
                child:Text('No Data'),
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
}