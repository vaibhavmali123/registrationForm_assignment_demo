class Users
{
  int id;
  String fName;
  String lName;
  String mno;
  String email;
  String gender;
  String password;
  String address;
  String landmark;
  String city;
  String state;
  String pincode;
  String eduInfo;
  String yearOfPass;
  String grade;
  String experience;
  String designation;
  String domain;

  bool isDone = false;

  Users({this.id, this.fName,this.lName,this.mno,this.email,this.gender,
    this.password,this.address,this.landmark,this.city,this.state,this.pincode,
    this.eduInfo,this.yearOfPass,this.grade,this.experience,this.designation,this.domain,
    this.isDone = false});

  factory Users.fromDatabaseJson(Map<String, dynamic> data) => Users(
    id: data['id'],
    fName: data['fName'],
    lName:data['lName'],
    mno:data['mno'],
    email:data['email'],
    gender:data['gender'],
    password:data['password'],
    address:data['address'],
    landmark:data['landmark'],
    city:data['city'],
    state:data['state'],
    pincode:data['pincode'],
    eduInfo:data['eduInfo'],
    yearOfPass:data['yearOfPass'],
    grade:data['grade'],
    experience:data['experience'],
    designation:data['designation'],
    domain:data['domain'],
    isDone: data['is_done'] == 0 ? false : true,
  );

  Map<String, dynamic> toDatabaseJson() => {
    "id": this.id,
    "fName": this.fName,
    "lName":this.lName,
    'mno':this.mno,
    'email':this.email,
    'gender':this.gender,
    'password':this.password,
    'address':this.address,
    'landmark':this.landmark,
    'city':this.city,
    'state':this.state,
    'pincode':this.pincode,
    'eduInfo':this.eduInfo,
    'yearOfPass':this.yearOfPass,
    'grade':this.grade,
    'experience':this.experience,
    'designation':this.designation,
    'domain':this.domain,
    "is_done": this.isDone == false ? 0 : 1,
  };
}