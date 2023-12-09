import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:tictactoe_game/screens/login.dart';

class RegistrationScreen extends StatelessWidget {
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
                  'Registro',
                  style: TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 47, 12, 165),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Crea una cuenta para empezar',
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
                _buildTextField('Nombre', Icons.person),
                SizedBox(height: 16.0),
                _buildTextField('Correo electrónico', Icons.email),
                SizedBox(height: 16.0),
                _buildTextField('Contraseña', Icons.lock, obscureText: true),
                SizedBox(height: 16.0),
                _buildCountryPicker(context),
                SizedBox(height: 32.0),
                _buildRegisterButton(context),
                SizedBox(height: 16.0),
                _buildLoginLink(context),
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

  Widget _buildCountryPicker(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: CountryPickerDropdown(
              initialValue: 'HN', // Código de país para Honduras
              itemBuilder: _buildDropdownItem,
              onValuePicked: (Country country) {
                // Maneja la selección del país aquí
              },
              itemFilter: (Country country) => [
                'AR',
                'AU',
                'AT',
                'BE',
                'BR',
                'CA',
                'CL',
                'CN',
                'CO',
                'CR',
                'CU',
                'CZ',
                'DK',
                'DO',
                'EC',
                'EG',
                'FI',
                'FR',
                'DE',
                'GR',
                'GT',
                'HT',
                'HN',
                'HU',
                'IN',
                'ID',
                'IE',
                'IT',
                'JP',
                'KR',
                'LU',
                'MY',
                'MX',
                'NL',
                'NZ',
                'NI',
                'NG',
                'NO',
                'PK',
                'PA',
                'PY',
                'PE',
                'PH',
                'PL',
                'PT',
                'PR',
                'RU',
                'SA',
                'RS',
                'SG',
                'ZA',
                'ES',
                'SE',
                'CH',
                'TH',
                'TR',
                'UA',
                'AE',
                'GB',
                'US',
                'UY',
                'VE',
                'VN'
              ].contains(country
                  .isoCode), // Agrega aquí los códigos de países deseados
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownItem(Country country) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("${country.name}"),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Agrega tu lógica de registro aquí
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 47, 12, 165),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        minimumSize: Size(double.infinity, 50.0),
      ),
      child: Text(
        'Registrarse',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget _buildLoginLink(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      child: Text(
        '¿Ya tienes una cuenta? Inicia sesión',
        style: TextStyle(
          color: Color.fromARGB(255, 47, 12, 165),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}