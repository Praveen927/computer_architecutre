import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final Function(String inp) onInput;
  String helpTxt = " ";
  String ltxt;
  Input({this.onInput, this.helpTxt, this.ltxt = "   ENTER ELEMENTS"});
  @override
  Widget build(BuildContext context) {
    double border = (MediaQuery.of(context).size.height /
        MediaQuery.of(context).size.width);

    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
    return TextFormField(
      onChanged: (val) {
        return onInput(val);
      },
      style: TextStyle(fontSize: font_Size),
      decoration: InputDecoration(
        labelText: ltxt,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat-Light.ttf',
          color: Colors.black,
          fontSize: font_Size / 1.5,
        ),
        helperText: helpTxt,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.5)),
      ),
    );
  }
}
