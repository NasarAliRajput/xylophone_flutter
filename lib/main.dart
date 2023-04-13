import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone Buttons Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            XylophoneButton(
              color: Colors.red,
              colorNumber: 1,
            ),
            XylophoneButton(
              color: Colors.orange,
              colorNumber: 2,
            ),
            XylophoneButton(
              color: Colors.yellow,
              colorNumber: 3,
            ),
            XylophoneButton(
              color: Colors.green,
              colorNumber: 4,
            ),
            XylophoneButton(
              color: Colors.blue,
              colorNumber: 5,
            ),
            XylophoneButton(
              color: Colors.purple,
              colorNumber: 6,
            ),
          ],
        ),
      ),
    );
  }
}

class XylophoneButton extends StatefulWidget {
  final Color color;
  final int colorNumber;

  const XylophoneButton(
      {Key? key, required this.color, required this.colorNumber})
      : super(key: key);

  @override
  _XylophoneButtonState createState() => _XylophoneButtonState();
}

class _XylophoneButtonState extends State<XylophoneButton> {
  double _height = 0;

  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  void _onTap() {
    playSound(widget.colorNumber);
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _height = 100;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _height = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            //color: widget.color,
            //border: Border.all(color: widget.color, width: 3),
            //borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                widget.color.withOpacity(0.5),
                widget.color.withOpacity(0.8),
                widget.color,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: _height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  //borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
