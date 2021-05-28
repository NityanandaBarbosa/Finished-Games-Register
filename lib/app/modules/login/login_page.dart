import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //0xFFF1b1c37
        backgroundColor: Color(0xFFF1b1c37),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: fullMediaWidth * 0.9,
            height: fullMediaHeight * 0.4,
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
              shape: BoxShape.rectangle,
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Finished Games Register",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.black54,
                    primaryColorDark: Colors.black54,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: fullMediaWidth,
                      child: TextField(
                        key: Key("emailField"),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Your Email",
                          labelText: "Email",
                          labelStyle:
                              TextStyle(fontSize: 13, color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.black54)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.supervised_user_circle),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.black54,
                    primaryColorDark: Colors.black54,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: fullMediaWidth,
                      child: TextField(
                        key: Key("passwordKey"),
                        decoration: InputDecoration(
                          hintText: "Your Password",
                          labelText: "Password",
                          labelStyle:
                              TextStyle(fontSize: 13, color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.black54)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.security),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      //child:SizedBox(height: 15),
                      child: ButtonTheme(
                        child: ElevatedButton(
                          child: Text('Sing Up',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal)),
                          onPressed: () async {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepOrangeAccent),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      //child:SizedBox(height: 15),
                      child: ButtonTheme(
                        child: ElevatedButton(
                            child: Text('Sing In',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                            onPressed: () async {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
