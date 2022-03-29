import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    home: homepage(),
  ));
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

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

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
                    ),
                    ListTile(
                      title: Text("ENGAGEMENTS"),
                    ),
                    ListTile(
                      title: Text("CLIENTS"),
                    ),
                    MouseRegion(
                      child: ListTile(
                        title: Text("EXECUTIVES"),
                      ),
                      onHover: (d){
                        print(d.delta.dx);
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
                                  Expanded(flex:2,child: Container(width: double.infinity,)),
                                  Expanded(flex:1,child: Card(
                                    child: Row(
                                      children: [
                                        Text("date")
                                      ],
                                    ),
                                  ))
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
                    Text("Your Stats"),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
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
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("New Requests",style: TextStyle(fontSize: 10),),
                                            Text("From Clients",style: TextStyle(fontSize: 10),)
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
                                  Container(
                                    child:Row(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Graph",style: TextStyle(fontSize: 10),),
                                              Text("Growth",style: TextStyle(fontSize: 10),)
                                            ],
                                          ),
                                        ),
                                        Expanded(flex:4,child: Container(width: double.infinity,)),
                                        Expanded(flex:3,child: Row(
                                          children: [
                                            Text("78.7"),
                                            Text("+4.2",style: TextStyle(fontSize: 10),)
                                          ],
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}



