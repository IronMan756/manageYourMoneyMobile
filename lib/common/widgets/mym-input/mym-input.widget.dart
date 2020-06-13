// import 'package:flutter/material.dart';

// class MYMInput extends StatefulWidget{
//   const MYMInput({ 
//     @required this.myController,
//     Key key,
//     this.labelText,
//     this.onChanged,
//     this.func,
//     this.validator,
//     this.errorText,
//     this.maxLines = 1,
//     this.req = false,
//     this.isDisabledBorder = false,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//     this.isEnabel,
//     this.color,
//     this.cursorColor,
//     this.helperColor,
//     this.borderRadius,
//     this.focusedBorderColor,
//     this.colorErrorText,
//     this.labelTextColor,
//     }): super(key: key);
//     final TextEditingController myController;
//     final String labelText;
//     final Function onChanged;
//     final Function func;
//     final String Function(String) validator;
//     final String errorText;
//     final int maxLines;
//     final bool req;
//     final bool isDisabledBorder;
//     final TextInputType keyboardType;
//     final bool obscureText;
//     final bool isEnabel;
//     final dynamic color;
//     final MaterialColor cursorColor;
//     final MaterialColor helperColor;
//     final double borderRadius;
//     final MaterialColor focusedBorderColor;
//     final MaterialColor colorErrorText;
//     final MaterialColor labelTextColor;

//     @override
//     _MYMInputState createState() => _MYMInputState();
// }
//   class _MYMInputState extends State<MYMInput>{
//     bool labelFlag = true;
//     @override
//     void initState(){
//       widget.myController.addListener(_setLabel);


//       super.initState();
//     }
//     void _setLabel(){
//       if(widget.myController.text.length == 1){
//         setState( () {
//           labelFlag = false;
//         });
//       } else if (widget.myController.text.isEmpty){
//         setState((){ 
//           labelFlag = true;
//         });
//       }
//     }
//     @override
//     void dispose(){
//       widget.myController.removeListener(_setLabel);
//       super.dispose();
//     }

//     @override
//     Widget build (BuildContext context){
//       return TextFormField(
//         autovalidate: widget.myController.text.isNotEmpty ? true : false,
//         validator: widget.validator,
//         obscureText: widget.obscureText,
//         keyboardType: widget.keyboardType,
//         enabled:widget.isEnabel,
//         onChanged: (String val) => widget.onChanged(),
//         controller: widget.myController,
//         maxLines: widget.maxLines,
//         style: TextStyle(
//           color: Colors.black38,
//         ),
//         cursorColor: widget.cursorColor,
//         decoration: InputDecoration(
//           helperText: labelFlag && widget.myController.text.isEmpty && widget.req
//           ? '* required'
//           : null,
//           helperStyle: TextStyle( color :Colors.black38),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(widget.borderRadius),
//             borderSide: BorderSide(color: Colors.blue, width: 3)),
//             border: widget.isDisabledBorder ? InputBorder.none : null,
//             disabledBorder: widget.isDisabledBorder
//                 ? InputBorder.none
//                 : UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),),
//             errorText: widget.errorText,
//             errorStyle: TextStyle(color: Colors.red),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide( color: Colors.blue)
//             ),
//             labelText: widget.labelText,
//             labelStyle: TextStyle(color: Colors.black38),   
//             enabledBorder: widget.isDisabledBorder
//               ? InputBorder.none
//               : OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(widget.borderRadius),
//                   borderSide:  BorderSide(color: Colors.blue))),
//         );
//     }
//   }
