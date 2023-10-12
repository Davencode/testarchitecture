import 'package:flutter/material.dart';

/* We define class CustomTextField structure to have modularity */

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  CustomTextField({
    //If we want some fields of this CustomTextField required to compile, just add REQUIRED key
    required this.controller,
    required this.hintText,
    this.obscureText = false, //in this case is not mandatory when we call it in our view and it compile the same
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      //structure of TextField custom
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}

/* USAGE : In una qualsiasi View Screen dove si vuole aggiungere ciò basta richiamarla così

CustomTextField(
  controller: myController,
  hintText: 'Inserisci qualcosa...',
  obscureText: true, // se vuoi una password
  keyboardType: TextInputType.emailAddress, // o qualsiasi altro tipo
  onChanged: (value) {
    // Fa qualcosa con il valore inserito
    print('Nuovo valore: $value');
  },
)

 */
