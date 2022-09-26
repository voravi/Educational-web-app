import 'package:educational_web_app/screens/web_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Educational App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              "Visit Educational webs...!",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

            SimpleOutlinedButton(
              outlineColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EducationalWebScreen(),
                        settings: RouteSettings(
                          arguments: "https://www.wikipedia.org/",
                        )),
                  );
                },
                child: Text("Wikipedia")
            ),

            SimpleOutlinedButton(
              outlineColor: Colors.teal,
              padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EducationalWebScreen(),
                      settings: RouteSettings(
                        arguments: "https://www.w3schools.com/",
                      )),
                );
              },
              child: Text("W3Schools"),
            ),
            SimpleOutlinedButton(
              outlineColor: Colors.teal,
              padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EducationalWebScreen(),
                      settings: RouteSettings(
                        arguments: "https://www.javatpoint.com/",
                      )),
                );
              },
              child: Text("JavaTpoint"),
            ),
            SimpleOutlinedButton(
              outlineColor: Colors.teal,
              padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EducationalWebScreen(),
                    settings: RouteSettings(
                        arguments: "https://www.tutorialspoint.com/index.htm"),
                  ),
                );
              },
              child: Text("TutorialsPoint"),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleOutlinedButton extends StatelessWidget {
  const SimpleOutlinedButton({this.child,
    this.textColor,
    this.outlineColor,
    required this.onPressed,
    this.borderRadius = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
    Key? key})
      : super(key: key);
  final Widget? child;
  final Function onPressed;
  final double borderRadius;
  final Color? outlineColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        textStyle: TextStyle(color: currentTheme.primaryColor),
        side: BorderSide(color: outlineColor ?? currentTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        primary: textColor ?? outlineColor ?? currentTheme.primaryColor,
      ),
      onPressed: onPressed as void Function()?,
      child: child!,
    );
  }
}