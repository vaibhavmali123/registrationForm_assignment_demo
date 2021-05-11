import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registrationform_assignment/Models/Users.dart';
import 'package:registrationform_assignment/blocs/UsersBloc.dart';
import 'package:registrationform_assignment/utils/ColorUtils.dart';
import 'package:registrationform_assignment/utils/StringsUtils.dart';
import 'package:registrationform_assignment/views/MyHomePage.dart';

class AddressPage extends StatefulWidget
{
  Users users=Users();

  AddressPage({this.users});

  AddressPageState createState()=>AddressPageState(users:users);
}
enum Fields{Address,Landmark,City,State,Pincode}

class AddressPageState extends State<AddressPage> {
  List<String>listState = [
    'Maharashtra',
    'Gujarat',
    'Karnataka',
    'Madhya Pradesh',
    'Delhi',
    'Others'
  ];
  final addressEditingController = TextEditingController();
  final landmarkEditingController = TextEditingController();
  final cityEditingController = TextEditingController();
  final pincodeEditingController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Users users = Users();
  final usersBloc = UsersBloc();


  AddressPageState({this.users});

  var selectedState;
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.pop(context);
        }, color: Colors.black87,),

        title: Text(StringsUtils.youraddress,
          style: GoogleFonts.notoSans(textStyle: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w800, color: Colors.black87)),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  autovalidate: autoValidate,
                  child: getForm())
            ],
          ),
        ),
      ),
    );
  }

  Widget getForm() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 1.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28,),
              SizedBox(
                height:80,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child: TextFormField(
                  controller: addressEditingController,
                  validator: (arg) =>
                      validateField(arg: arg, fields: Fields.Address),
                  decoration: InputDecoration(
                      hintText: StringsUtils.address,
                      prefixIcon: Icon(Icons.location_city),
                      hintStyle: TextStyle(fontSize: 14,
                          color: Colors.black38.withOpacity(0.2),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                      focusedBorder: focusedBorder,
                      enabledBorder: enabledBorder,
                      helperText: ' ',
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder
                  ),
                ),
              ),
              SizedBox(height: 22,),
              SizedBox(
                height: 80,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child: TextFormField(
                  controller: landmarkEditingController,
                  validator: (arg) =>
                      validateField(arg: arg, fields: Fields.Landmark),
                  decoration: InputDecoration(
                      hintText: StringsUtils.landmark,
                      prefixIcon: Icon(Icons.location_city),
                      hintStyle: TextStyle(fontSize: 14,
                          color: Colors.black38.withOpacity(0.2),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                      focusedBorder: focusedBorder,
                      enabledBorder: enabledBorder,
                      helperText: ' ',
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder
                  ),
                ),
              ),
              SizedBox(height: 22,),
              SizedBox(
                height: 80,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child: TextFormField(
                  controller: cityEditingController,
                  validator: (arg) =>
                      validateField(arg: arg, fields: Fields.City),
                  decoration: InputDecoration(
                      hintText: StringsUtils.city,
                      prefixIcon: Icon(Icons.location_city),
                      hintStyle: TextStyle(fontSize: 14,
                          color: Colors.black38.withOpacity(0.2),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                      focusedBorder: focusedBorder,
                      enabledBorder: enabledBorder,
                      helperText: ' ',
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder
                  ),
                ),
              ),
              SizedBox(height: 22,),
              Container(
                height: 54,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    border: Border.all(width: 1.2, color: Colors.black87)),
                child: Center(
                    child:
                    Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: Colors.white,
                          buttonTheme: ButtonTheme.of(context).copyWith(
                            alignedDropdown: true,
                          )
                      ),
                      child: DropdownButton<String>(
                        value: selectedState,
                        underline: Container(
                          height: 1.0,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                  BorderSide(
                                      color: Colors.transparent, width: 0.0))),
                        ),
                        isExpanded: true,
                        focusColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        icon: Image.asset(
                          'assets/images/sort-down.png', height: 22,
                          width: 18,),
                        onChanged: (value) {
                          setState(() {
                            selectedState = value;
                          });
                        },
                        items: listState
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          StringsUtils.selectState,
                          style: TextStyle(
                              fontSize: 14,
                              color:selectedState==null && autoValidate==true?Colors.red:Colors.black38.withOpacity(0.3),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(height: 22,),
              SizedBox(
                height: 80,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child: TextFormField(
                  controller: pincodeEditingController,
                  keyboardType:TextInputType.number,
                  inputFormatters:<TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  maxLength:6,
                  validator: (arg) =>
                      validateField(arg: arg, fields: Fields.Pincode),
                  decoration: InputDecoration(
                      hintText: StringsUtils.pin,
                      prefixIcon: Icon(Icons.location_city),
                      hintStyle: TextStyle(fontSize: 14,
                          color: Colors.black38.withOpacity(0.2),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                      focusedBorder: focusedBorder,
                      enabledBorder: enabledBorder,
                      helperText: ' ',
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder
                  ),
                ),
              ),
              SizedBox(height: 35,),
              SizedBox(
                height: 50,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(),
                  color: ColorUtils.colorConvert(ColorUtils.primaryColor),
                  child: Text(StringsUtils.submit,
                      style: GoogleFonts.notoSans(textStyle:
                      TextStyle(fontSize: 16, height: 2,
                          fontWeight: FontWeight.w700, color: Colors.white))),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      setState(() {
                        autoValidate = true;
                      });
                    }
                    if (addressEditingController.text.length>0 && landmarkEditingController.text.length>0 &&
                    selectedState!=null && pincodeEditingController.text.length>0) {
                      addDataAndNavigate();
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.0),
      borderSide: BorderSide(width: 1.6, color: Colors.red));

  var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.0),
      borderSide: BorderSide(width: 1.6, color: Colors.black87)
  );
  var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.0),
      borderSide: BorderSide(width: 1.4, color: Colors.black87)
  );

  validateField({String arg, Fields fields}) {
    switch (fields) {
      case Fields.Address:
        if (arg.length <= 3) {
          return 'Address should be more than 3 characters';
        }
        else {
          return null;
        }
        break;
      case Fields.Landmark:
        if (arg.length <= 3) {
          return 'Landmark should be more than 3 characters';
        }
        else {
          return null;
        }
        break;
      case Fields.City:
        if (arg.length <= 0) {
          return 'City should not empty';
        }
        else {
          return null;
        }
        break;
      case Fields.Pincode:
        if (arg.length <= 0) {
          return 'Pincode should not empty';
        }
        else {
          return null;
        }
        break;
    }
  }

  void addDataAndNavigate() {
    users.address = addressEditingController.text;
    users.landmark = landmarkEditingController.text;
    users.city = cityEditingController.text;
    users.pincode = pincodeEditingController.text;
    users.state = selectedState.toString();
    print("USERS ${users.fName}");
    if (users.fName.isNotEmpty) {
      usersBloc.addUsers(users);
      Fluttertoast.showToast(
          msg:StringsUtils.sucessMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
        return MyHomePage();
      }));
    }
  }
}