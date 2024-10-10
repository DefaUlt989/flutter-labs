import 'package:flutter/material.dart';

class SizeChanger extends StatefulWidget {
  @override
  State<SizeChanger> createState() => _SizeChangerState();
}

class _SizeChangerState extends State<SizeChanger> {
  double _width = 10;
  double _height = 10;
  double _topright = 0;

  _onWidth(double value) {
    setState(() {
      _width = value;
    });
  }

  _onHeight(double value) {
    setState(() {
      _height = value;
    });
  }

  _onRight(double value){
    setState(() {
      _topright = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            const Text("Width: "),
            Text(_width.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        Slider(value: _width, min: 0, max: 300, onChanged: _onWidth),
        Row(
          children: [
            const Text("Height: "),
            Text(_height.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        Slider(value: _height, min: 0, max: 300, onChanged: _onHeight),
        Row(
          children: [
            const Text("Radius: "),
            Text(_topright.round().toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Slider(value: _topright, min: 0, max: 300, onChanged: _onRight),
        const SizedBox(height: 20),
        Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: Colors.red,
              borderRadius: BorderRadius.only(topRight: Radius.circular(_topright))
          ),
        )
      ],
    );
  }
}