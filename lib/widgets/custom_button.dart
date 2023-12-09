import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool
      neon; // Agrega esta variable para activar/desactivar el estilo neon

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.neon = false, // Por defecto, el estilo neon está desactivado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: neon ? Colors.blue : Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: neon
              ? [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 189, 62, 53),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [], // Agrega sombras solo si el estilo neon está activado
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.transparent,
            onPrimary: neon ? Colors.blue : Colors.black,
            minimumSize: Size(width, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: neon ? Colors.white : Colors.transparent,
                width: 2.0,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: neon ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
