import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pickcar/bloc/signup/signupbloc.dart';
import 'package:pickcar/datamanager.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _signupbloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Form(
        key: _signupbloc.formkey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(12, 25, 12, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _namewidget(MediaQuery.of(context).size.height * 0.15,MediaQuery.of(context).size.width * 0.9),
                  SizedBox(height: 20,),
                  _signupbutton(context , _signupbloc.signupform),

                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }

  Widget _signupbutton(BuildContext context , Function onclick) {

  return ButtonTheme(
    
    height:75,
    minWidth: MediaQuery.of(context).size.width * 0.9,
    child: GradientButton(
      elevation: 5,
      callback: () {
        onclick();
      },
      gradient: LinearGradient(colors: [
        PickCarColor.colormain,
        PickCarColor.colormain.withOpacity(0.7),
        Colors.yellow
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Center(
        child: Text(
          UseString.signup,
          style: TextStyle(fontSize: 24),
        ),
      ),
    ),
  );
}


  TextStyle _textstyle() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Pridi-Bold',
      color: PickCarColor.colormain,
    );
  }

  Widget _container(double height , double width, List<Widget> data) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[...data],
      ),
    );
  }

  Widget _namewidget(double height , double width) {
    return _container(height , width , [
      Text(
        UseString.name,
        style: _textstyle(),
      ),
      TextFormField(
        controller: _signupbloc.namecontroller,
        decoration: InputDecoration(
          hintText: UseString.name,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return UseString.nameemptyval;
          }
        },
      )
    ]);
  }
}