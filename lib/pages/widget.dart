import 'package:flutter/material.dart';
import 'package:get2gether/pages/connections/generate.dart';


///For all my small, reusable widgets

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(        child: ListView(
      children: <Widget>[

        UserAccountsDrawerHeader(
          accountEmail: new Text("jaredezzethasson@gmail.com", style: TextStyle(color: Colors.white)),
          accountName: new Text("Jared Hasson", style: TextStyle(color: Colors.white),),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://www.navitasventures.com/wp-content/uploads/2016/06/Material-design-background-514054880_2126x1416-1024x682.jpeg"),
                  fit: BoxFit.fill
              )
          ),
          onDetailsPressed: (){
            Navigator.pushNamed(context, "/account");
          },
          otherAccountsPictures: <Widget>[
            GestureDetector(
              child: Image(
                image: AssetImage('assets/miniqr.png'),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenerateScreen()),
                );
              },
            )
          ],
        ),
        ListTile(
          title: Text("Activity List"),
          trailing: Icon(Icons.format_list_bulleted),
          onTap: () {
            Navigator.pushNamed(context, "/activitylist");
          },
        ),
        ListTile(
          title: Text("Interests"),
          trailing: Icon(Icons.star),
          onTap: () {
            Navigator.pushNamed(context, "/interests");
          },
        ),
        ListTile(
          title: Text("Connections"),
          trailing: Icon(Icons.people_outline),
          onTap: () {
            Navigator.pushNamed(context, "/connections");
          },
        ),
        ListTile(
          title: Text("Add New Activity"),
          trailing: Icon(Icons.add),
          onTap: () {
            Navigator.pushNamed(context, "/new");
          },
        ),
        ListTile(
          title: Text("Log Out"),
          trailing: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/login");
          },
        ),
      ],
    )

    );
  }
}

class Tick extends StatelessWidget {
  final DecorationImage image;
  Tick({this.image});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 250.0,
      height: 250.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: image,
      ),
    ));
  }
}

class FormContainer extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  FormContainer({this.usernameController,this.passwordController});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new InputFieldArea(
                    hint: "Username",
                    obscure: false,
                    icon: Icons.person_outline,
                    controller: usernameController,
                  ),
                  new InputFieldArea(
                    hint: "Password",
                    obscure: true,
                    icon: Icons.lock_outline,
                    controller: passwordController,
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;
  InputFieldArea({this.hint, this.obscure, this.icon, this.controller});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.5,
            color: Colors.white24,
          ),
        ),
      ),
      child: new TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    ));
  }
}

class SignUp extends StatelessWidget {
  SignUp();

  @override
  Widget build(BuildContext context) {
    return (new FlatButton(
      padding: const EdgeInsets.only(
        top: 130.0,
      ),
      onPressed: (){
        Navigator.pushNamed(context, "/signup");
      },
      child: new Text(
        "Don't have an account? Sign Up",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.white,
            fontSize: 12.0),
      ),
    ));
  }
}

class LogIn extends StatelessWidget {
  LogIn();
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: const Color.fromRGBO(106, 94, 175, 1.0),
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),
      child: new Text(
        "Log In",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    ));
  }
}
