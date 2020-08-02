
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthInput extends StatefulWidget{
  const AuthInput({
    Key key,
    this.myController,
    this.labelText,
    this.func,
    this.validator,
    this.errorText,
    this.maxLines,
    this.keyboardType = TextInputType.text,
    this.obscureText,
    this.isEnable = true,
    this.hint,
    this.icon,
  }): super(key:key);
  final TextEditingController myController;
  final String labelText;
  final Function func;
  final String Function(String) validator;
  final String errorText;
  final int maxLines;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isEnable;
  final String hint;
  final Icon icon;

  @override
  _AuthInputState createState() => _AuthInputState();
}
class _AuthInputState extends State<AuthInput>{

  bool labelFlag = true;
  @override
  void initState(){
    widget.myController.addListener(_setLabel);

    super.initState();
  }
  void _setLabel(){
    if ( widget.myController.text.length == 1){
      setState((){
        labelFlag = false;
      });
    } else if (widget.myController.text.isEmpty){
      setState((){
        labelFlag = true;
      });
    }
  }
  @override
  void dispose(){
    widget.myController.removeListener(_setLabel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.only(left: 20, right: 20,),
          child: TextFormField(
              validator:widget.validator,
              controller: widget.myController,
              obscureText: widget.obscureText,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black38),
                  hintText: widget.hint,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.01),
                  ),
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: IconTheme(
                          data: const IconThemeData(
                            color:  Color.fromRGBO(0, 0, 0, 0.85),
                          ),
                          child: widget.icon)))));

  }

}