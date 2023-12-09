import 'package:flutter/material.dart';
import 'package:tictactoe_game/screens/main_screen.dart';
import 'package:tictactoe_game/screens/registro.dart';
class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        primaryColor: Color.fromARGB(255, 47, 12, 165),
        accentColor: Color.fromARGB(255, 47, 12, 165),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 47, 12, 165), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromARGB(255, 47, 12, 165),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 47, 12, 165),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Inicia sesión para continuar',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16.0),
                Image.asset(
                  'assets/logo.png',
                  height: 120.0,
                ),
                SizedBox(height: 32.0),
                _buildTextField('Username', Icons.person),
                SizedBox(height: 16.0),
                _buildTextField('Password', Icons.lock, obscureText: true),
                SizedBox(height: 32.0),
                _buildLoginButton(context),
                SizedBox(height: 16.0),
                _buildSignUpLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData prefixIcon,
      {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 47, 12, 165),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        minimumSize: Size(double.infinity, 50.0),
      ),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationScreen()),
        );
      },
      child: Text(
        '¿No tienes una cuenta? Regístrate',
        style: TextStyle(
          color: Color.fromARGB(255, 47, 12, 165),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}