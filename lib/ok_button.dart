import 'package:flutter/material.dart';
void main() => runApp(MyButton());
class MyButton extends StatelessWidget {
  MyButton({Key? key}) : super(key:key);
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
          left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
          right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
          bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
        ),
      ),
      child: Container(
        padding: const
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
            left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
            right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
            bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
          ),
          color: Colors.grey,
        ),
        child: const Text(
            'OK',textDirection: TextDirection.ltr,textAlign: TextAlign.center, style: TextStyle(color: Colors.black)
        ),
      ),
    );

  }
}
// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(this.title),
//       ),
//       body: Center(
//           child:
//           Image.asset("assets/hou-china-0830-2.jpg"),//icon làm tương tự
//       ),
//     );
//   }
// }
