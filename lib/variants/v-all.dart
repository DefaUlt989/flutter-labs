import 'package:flutter/material.dart';

class AllVariant extends StatefulWidget {
  @override
  State<AllVariant> createState() => _AllVariantState();
}

class _AllVariantState extends State<AllVariant> {
  double _red = 0;
  double _green = 0;
  double _blue = 0;
  double _topright = 0;
  double _topleft = 0;
  double _bottomright = 0;
  double _bottomleft = 0;
  double _width = 100;
  double _height = 100;

  
  void _topRight(double value) {
    setState(() {
      _topright = value;
    });
  }
  void _bottomRight(double value) {
    setState(() {
      _bottomright = value;
    });
  }
  void _topLeft(double value) {
    setState(() {
      _topleft = value;
    });
  }
  void _bottomLeft(double value) {
    setState(() {
      _bottomleft = value;
    });
  }

  void _onRed(double value) {
    setState(() {
      _red = value;
    });
  }

  void _onGreen(double value) {
    setState(() {
      _green = value;
    });
  }

  void _onBlue(double value) {
    setState(() {
      _blue = value;
    });
  }

  void _onWidth(double value) {
    setState(() {
      _width = value;
    });
  }

  void _onHeigth(double value) {
    setState(() {
      _height = value;
    });
  }



  Widget _buildSliderRow(String label1, double value1, Function(double) onChanged1,
      String label2, double value2, Function(double) onChanged2,
      {double min1 = 0, double max1 = 255, double min2 = 0, double max2 = 255}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(label1),
              Slider(
                value: value1,
                min: min1,
                max: max1,
                onChanged: onChanged1,
              ),
              Text(value1.round().toString()),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(label2),
              Slider(
                value: value2,
                min: min2,
                max: max2,
                onChanged: onChanged2,
              ),
              Text(value2.round().toString()),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = Color.fromRGBO(_red.round(), _green.round(), _blue.round(), 1);

    return Column(
      children: [
        _buildSliderRow("Red", _red, _onRed, "Green", _green, _onGreen),
        _buildSliderRow("Blue", _blue, _onBlue, "BR", _bottomright, _bottomRight, max2: 100),
        _buildSliderRow("Width", _width, _onWidth, "Height", _height, _onHeigth, max1: 300, max2: 300),
        _buildSliderRow("TL", _topleft, _topLeft, "TR", _topright, _topRight, max1: 100, max2: 100),
        Row(
          children: [
            const Text("BL:"),
            Text(_bottomleft.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        Slider(value: _bottomleft, min: 0, max: 100, onChanged: _bottomLeft),


        const SizedBox(height: 20),
        Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: currentColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(_topright),
            topLeft: Radius.circular(_topleft),
            bottomRight: Radius.circular(_bottomright),
            bottomLeft: Radius.circular(_bottomleft)),
          ),
        )
      ],
    );
  }
}