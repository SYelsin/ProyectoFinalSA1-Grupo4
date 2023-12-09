import 'package:flutter/material.dart';
import 'package:tictactoe_game/responsive/responsive.dart';
import 'package:tictactoe_game/screens/create_room_screen.dart';
import 'package:tictactoe_game/screens/join_room_screen.dart';
import 'package:tictactoe_game/screens/login.dart';
import 'package:tictactoe_game/screens/registro.dart';
import 'package:tictactoe_game/widgets/custom_button.dart';
import 'package:tictactoe_game/widgets/customized_button.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 140,
              width: 180,
              child: Image(
                  image: AssetImage("assets/logo.png"), fit: BoxFit.cover),
            ),
            const SizedBox(height: 40),
            CustomizedButton(
              buttonText: "Login",
              buttonColor: Color.fromARGB(255, 47, 12, 165),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            ),
            CustomizedButton(
              buttonText: "Registrarse",
              buttonColor: Colors.white,
              textColor: Color.fromARGB(255, 47, 12, 165),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => RegistrationScreen()));
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
