import 'package:flutter/material.dart';
// import 'package:flutter_dog_quiz/colorscheme.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EyeQuiz());
}

class EyeQuiz extends StatelessWidget {
  const EyeQuiz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eye Exam Time',
      home: const MyHomePage(title: 'Eye Exam Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const appBarColor = Color(0xffDCE4C9);

    return Scaffold(
      appBar: AppBar(

        backgroundColor: appBarColor,

        title: Text(widget.title),
      ),
      body: Center(
          child: SizedBox(
            width: 300,
          child: Card(
            color: Color(0xffD9EAFD),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Time for your next eye exam?', textAlign: TextAlign.center,),
              subtitle: Text("Take our quiz to see if it\'s time for you to set up your annual eye exam",
                textAlign: TextAlign.center,
              ),

            ),

            TextButton.icon(
              icon: Icon(Icons.remove_red_eye_outlined, color: Colors.white,),
              label: const Text("Let\'s Go!"),

              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
            ),

          ],
        ),
      ),
      ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

Route _createRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      QuizPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

class QuizPage extends StatelessWidget{
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Quiz Page')
      )
    );
  }
}