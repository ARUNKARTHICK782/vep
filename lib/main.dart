import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vepsample/ui/pages/loginpagemain.dart';
import 'ui/pages/login_page.dart';
import 'package:vepsample/profilebuilder/generalinfo.dart';
import 'package:vepsample/regeneratingpassword.dart';

import 'edituserdetails.dart';
import 'forgetpassword.dart';
GoogleSignIn _googleSignIn = GoogleSignIn();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBdr6Wd4GCiVnseK7Oax6fjT7X9rI7904w",
    authDomain: "vepsample.firebaseapp.com",
    projectId: "vepsample",
    storageBucket: "vepsample.appspot.com",
    messagingSenderId: "667342854510",
    appId: "1:667342854510:web:76b328a8c05cc82b52097f",
    measurementId: "G-NZYWGKHZZP"
  );
  await Firebase.initializeApp(
      options: firebaseConfig
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: Colors.grey,
      scaffoldBackgroundColor: Color(0xffe6f1f7)
    ),
    home: loginpagemain()
  ));
}

class homepage extends StatefulWidget {
  const homepage({Key? key,required String uid}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("VEP LOGO"),
                    SizedBox(height: 80,),

                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text("DASHBOARD"),
                      onTap: (){
                        setState(() {

                        });
                      },
                    ),
                    ListTile(
                      title: Text("ENGAGEMENTS"),
                      onTap: (){
                        setState(() {

                        });
                      },
                    ),
                    ListTile(
                      title: Text("CLIENTS"),
                      onTap: (){
                        setState(() {

                        });
                      },
                    ),
                    ListTile(
                      title: Text("EXECUTIVES"),
                      onTap: (){
                        setState(() {

                        });
                      },
                    ),
                    ListTile(
                      title: Text("SUPPORT"),
                    ),
                    ListTile(
                      title: Text("MANAGERS"),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex:7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Card(
                            child: Container(
                              height: 70,
                              child: Row(
                                children: [
                                  Expanded(flex:1,child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Dashboard"),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    Icon(Icons.notification_add),
                                    CircleAvatar(),
                                    Icon(Icons.logout)

                                  ]
                              )
                          ),
                        )
                      ],
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                            children:[
                              Expanded(
                                flex:4,
                                child: Row(
                                  children: [
                                    CircleAvatar(radius: 35,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Text("Frank Smith"),
                                            Text("Lorem ipsium"),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                  color: Colors.yellow,
                                                  width: 150,
                                                  child: Center(child: Text("Complete Your Profile"))),
                                            )
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex:3,
                                  child:Row(
                                      children:[
                                        Text("Profile Strength"),
                                        Flexible(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Container(
                                              height: 10,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(height:30),
                    Text("Upcoming engagements",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    Text("Scheduled interviews"),
                    Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                                width: 250,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Column(
                                        children: [
                                          Text("12",style: TextStyle(fontSize: 50),),
                                          Text("Dec")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex:4,
                                        child:Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              Text("10.30-11.30"),
                                              SizedBox(
                                                  height:5
                                              ),
                                              Row(
                                                  children:[
                                                    CircleAvatar(
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Company name",style:TextStyle(fontSize: 15)),
                                                        Text("Client name",style:TextStyle(fontSize: 10))
                                                      ],
                                                    ),
                                                  ]
                                              ),
                                              SizedBox(
                                                  height:5
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                    color: Colors.yellow,
                                                    width: 90,
                                                    child: Center(child: Text("Reschedule"))),
                                              )
                                            ]
                                        )
                                    )
                                  ],
                                )
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                                width: 250,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Column(
                                        children: [
                                          Text("14",style: TextStyle(fontSize: 50),),
                                          Text("Dec")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex:4,
                                        child:Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              Text("10.30-11.30"),
                                              SizedBox(
                                                  height:5
                                              ),
                                              Row(
                                                  children:[
                                                    CircleAvatar(
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Company name",style:TextStyle(fontSize: 15)),
                                                        Text("Client name",style:TextStyle(fontSize: 10))
                                                      ],
                                                    ),
                                                  ]
                                              ),
                                              SizedBox(
                                                  height:5
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                    color: Colors.yellow,
                                                    width: 90,
                                                    child: Center(child: Text("Reschedule"))),
                                              )
                                            ]
                                        )
                                    )
                                  ],
                                )
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                                width: 250,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Column(
                                        children: [
                                          Text("14",style: TextStyle(fontSize: 50),),
                                          Text("Dec")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex:4,
                                        child:Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              Text("10.30-11.30"),
                                              SizedBox(
                                                  height:5
                                              ),
                                              Row(
                                                  children:[
                                                    CircleAvatar(
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Company name",style:TextStyle(fontSize: 15)),
                                                        Text("Client name",style:TextStyle(fontSize: 10))
                                                      ],
                                                    ),
                                                  ]
                                              ),
                                              SizedBox(
                                                  height:5
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                    color: Colors.yellow,
                                                    width: 90,
                                                    child: Center(child: Text("Reschedule"))),
                                              )
                                            ]
                                        )
                                    )
                                  ],
                                )
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                    SizedBox(height:30),
                    Text("Your Stats",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    Text("Reports"),
                    Container(width: double.infinity,),
                    Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: 250,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex:5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Engagements",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            Text("Ongoing",style: TextStyle(fontSize: 10),)
                                          ],
                                        ),
                                      ),
                                      Expanded(flex:4,child: Container(width: double.infinity,)),
                                      Expanded(flex:3,child: Icon(Icons.note)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text("03",style: TextStyle(fontSize: 50),),
                                        Spacer(),
                                        ElevatedButton(onPressed: (){},child: Text("View All"),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: 250,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex:5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Invoices",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            Text("Updated",style: TextStyle(fontSize: 10),)
                                          ],
                                        ),
                                      ),
                                      Expanded(flex:4,child: Container(width: double.infinity,)),
                                      Expanded(flex:3,child: Icon(Icons.note)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(flex:1,child: Icon(Icons.warning)),
                                        Expanded(
                                          flex:2,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Text("You are eligible for raising an invoice if you participated in an "),
                                                SizedBox(height: 10,),
                                                ElevatedButton(onPressed: (){},child:Text("Apply now"))
                                              ]
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: 250,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex:5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Engagements",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            Text("Till today",style: TextStyle(fontSize: 10),)
                                          ],
                                        ),
                                      ),
                                      Expanded(flex:4,child: Container(width: double.infinity,)),
                                      Expanded(flex:3,child: Icon(Icons.note)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text("03",style: TextStyle(fontSize: 50),),
                                        Spacer(),
                                        ElevatedButton(onPressed: (){},child: Text("View All"),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: 250,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex:5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Support",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            Text("Tickets",style: TextStyle(fontSize: 10),)
                                          ],
                                        ),
                                      ),
                                      Expanded(flex:4,child: Container(width: double.infinity,)),
                                      Expanded(flex:3,child: Icon(Icons.note)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text("08",style: TextStyle(fontSize: 50),),
                                        Spacer(),
                                        ElevatedButton(onPressed: (){},child: Text("View All"),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ],
                )
            ),

          ],
        ),
      )
    );
  }
}

class googelsignin extends StatefulWidget {
  const googelsignin({Key? key}) : super(key: key);

  @override
  _googelsigninState createState() => _googelsigninState();
}

class _googelsigninState extends State<googelsignin> {
  String verificationId="";
  GoogleSignInAccount? _currentUser;
  GoogleSignInAccount? _user;
  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/admob.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });

    // Once signed in, return the UserCredential
    UserCredential userCredential=await FirebaseAuth.instance.signInWithPopup(googleProvider);
    print(userCredential.user?.displayName);
    print(userCredential.user?.photoURL);
    print(userCredential.user?.metadata);
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
  signinwithphonenumber(String phno) async{


  }
  @override
  Widget build(BuildContext context) {
    ConfirmationResult? confirmationResult;
    String mobileno="";
    String otp="";
    bool temp=false;
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(child: Image(image: AssetImage("images/googlesigninbtn.png"),height: 50,width: 50,),onTap: signInWithGoogle,),
          GestureDetector(child: Icon(Icons.phone),onTap: () async{
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                content: StatefulBuilder(
                    builder: (BuildContext context,StateSetter setState){
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                  helperText: "Mobile No"
                              ),
                              onChanged: (s){
                                mobileno=s;
                              },
                            ),
                          ),
                          ElevatedButton(onPressed: ()async{
                            FirebaseAuth auth = FirebaseAuth.instance;
                            confirmationResult = await auth.signInWithPhoneNumber(mobileno);
                            RecaptchaVerifier(
                              onSuccess: () => print('reCAPTCHA Completed!'),
                              onError: (FirebaseAuthException error) => print(error),
                              onExpired: () => print('reCAPTCHA Expired!'),
                            );
                            setState(() {
                              temp=true;
                            });
                          }, child: Text("Send OTP")),
                          (temp)?Column(
                            children: [
                              Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      helperText: "OTP"
                                  ),
                                  onChanged: (s){
                                    otp=s;
                                  },
                                ),
                              ),
                              ElevatedButton(onPressed: () async {
                                await confirmationResult?.confirm(otp).then((value) {
                                  print(value?.user?.uid);
                                  Navigator.of(context).pop();
                                });

                              }, child: Text("Verify OTP"))
                            ],
                          ):Text("")
                        ],
                      );
                    }
                ),
              );
            });
          },),
        ],
      ),),
    );
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        print(_currentUser?.displayName!);
      }
    });
    _googleSignIn.signInSilently();


  }
}

class verifypage extends StatefulWidget {
  const verifypage({Key? key}) : super(key: key);

  @override
  _verifypageState createState() => _verifypageState();
}

class _verifypageState extends State<verifypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                      child: Text("VEP LOGO")),
                  Positioned(
                    top: 200,
                    left: 100,
                    child: Stack(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: MediaQuery.of(context).size.width* 3/4,
                            height: 420,
                            child: Padding(
                              padding: const EdgeInsets.all(100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Verify your email address",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                  Text("We have sent an OTP on a***@g***.com",style: TextStyle(fontSize: 15),),
                                  SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Container(
                                          width: 50,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder()
                                            ),
                                          )
                                      ),
                                      SizedBox(width:20),
                                      Container(
                                          width: 50,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder()
                                            ),
                                          )
                                      ),
                                      SizedBox(width:20),
                                      Container(
                                          width: 50,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder()
                                            ),
                                          )
                                      ),
                                      SizedBox(width:20),
                                      Container(
                                          width: 50,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder()
                                            ),
                                          )
                                      ),
                                      SizedBox(width:20),
                                      Container(
                                          width: 50,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder()
                                            ),
                                          )
                                      ),
                                      SizedBox(width:20),
                                      Container(
                                          width: 50,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder()
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  Container(
                                    width: 400,
                                    child: Row(
                                      children: [
                                        Expanded(flex:2,child: Text("Resent OTP in ")),
                                        Expanded(flex:1,child: Container(width:  double.infinity,),),
                                        Expanded(flex:2,child: Text("Wrong email address?"))
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: (){},
                                        child: Text("Verify OTP"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 700,
                    top:100,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 600,
                          width:500,
                          child: Image(image: AssetImage("images/frontbanner.png",),fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




