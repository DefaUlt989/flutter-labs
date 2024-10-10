import 'package:flutter/material.dart';

class RGBColor extends StatefulWidget {
  @override
  State<RGBColor> createState() => _RGBColorState();
}

class _RGBColorState extends State<RGBColor> {
  double _red = 0;
  double _green = 0;
  double _blue = 0;

  _onRed(double value) {
    setState(() {
      _red = value;
    });
  }

  _onGreen(double value) {
    setState(() {
      _green = value;
    });
  }

  _onBlue(double value){
    setState(() {
      _blue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = Color.fromRGBO(_red.round(), _green.round(), _blue.round(), 1);

    return Column(
      children: [
        Row(
          children: [
            const Text("Red: "),
            Text(_red.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        Slider(value: _red, min: 0, max: 255, onChanged: _onRed),
        Row(
          children: [
            const Text("Green: "),
            Text(_green.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        Slider(value: _green, min: 0, max: 255, onChanged: _onGreen),
        Row(
          children: [
            const Text("Blue: "),
            Text(_blue.round().toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Slider(value: _blue, min: 0, max: 255, onChanged: _onBlue),
        const SizedBox(height: 20),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: currentColor,
          ),
        )
      ],
    );
  }
}