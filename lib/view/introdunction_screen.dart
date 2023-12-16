import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:to_do_app/view/Homescreen.dart';
import 'package:to_do_app/view/phone_authentication.dart';
import 'package:to_do_app/view/registration.dart';

class Introduction_screen extends StatelessWidget {
  const Introduction_screen({super.key});

  @override
  Widget build(BuildContext context) {
    PageDecoration decorationpage = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
      bodyTextStyle: TextStyle(
        fontSize: 10,
        color: Colors.brown,
      ),
      boxDecoration: BoxDecoration(color: Colors.black),
    );
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'One place for all your tasks',
          body:
              "Plan your day effectively by capturing and organizing all your tasks",
          image: IntroImage('assets/images/todo13.jpg'),
          //  decoration: PageDecoration(pageColor: Colors.black)
        ),
        PageViewModel(
            title: ' Access anywhere',
            body:
                "Plan your day effectively by capturing and organizing all your tasks",
            image: IntroImage('assets/images/todo12.jpg')),
        PageViewModel(
            title: 'Make you disciplined',
            body: "This make you well disciplied,planned each day",
            image: IntroImage('assets/images/todo11.png')),
      ],
      onSkip: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Registration())),
      onDone: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Registration())),
      showSkipButton: true,
      skip: Text('Skip'),
      next: Icon(Icons.arrow_forward_rounded),
      done: Text('Done'),
      dotsDecorator: DotsDecorator(
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          size: Size(12, 10),
          activeSize: Size(22, 10),
          activeColor: Colors.green),
    );
  }
}

Widget IntroImage(String imgpath) {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      imgpath,
      width: double.infinity,
    ),
  );
}
