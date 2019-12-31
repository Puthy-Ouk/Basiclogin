
import 'package:flutter/material.dart';
void main() => runApp(Login());
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isChecked = false;
  void check(bool check){
    setState(() {
      _isChecked = check;
    });
  }

 

  String _name = " ";
  String _pass = " ";
  String useName(String name){
    setState(() {
      _name = name;
    });
    return _name;
  }

 String passWord(String pass){
    setState(() {
      _pass = pass;
    });
    return _pass;
  }

  // get resutl
   String _result = " " ;
 void results(String result){
    setState(() {
       if(_isChecked){
          _result= "@Username " + _name + " ,@Password " + _pass;
       }else{
          _result="Are you argee?";
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               child: Center(
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: "Username",
                     icon: Icon(Icons.person)
                   ),
                   onChanged: (String name){
                    useName(name);
                   }
                 ),
               ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               child: Center(
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: "Password",
                     icon: Icon(Icons.lock)
                   ),
                    onChanged: (String pass){
                     passWord(pass);
                   }
                 ),
               ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                 child: Row(
                  children: <Widget>[
                  Container(
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (bool result){
                        check(result);
                      }
                    ),
                  ),
                   Text("Are you agree?"),
                  ],
                 ),
              ),
            ),
                  
            Container(
              width: 300.0,
              child: RaisedButton(
                child: Text("Login",style: TextStyle(fontSize: 32.0,
                fontWeight: FontWeight.bold,
                ),),
                onPressed: ()=> results(_result),
                color: Colors.blue,
               ),
            ),
             
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                height: 50.0,
                child:Card(
                  child: Text(_result),
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}