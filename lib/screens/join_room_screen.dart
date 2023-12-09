import 'package:flutter/material.dart';
import 'package:tictactoe_game/resources/socket_methods.dart';
import 'package:tictactoe_game/responsive/responsive.dart';
import 'package:tictactoe_game/widgets/custom_button.dart';
import 'package:tictactoe_game/widgets/custom_text.dart';
import 'package:tictactoe_game/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 47, 12, 165),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Responsive(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  shadows: [
                    Shadow(
                      blurRadius: 40,
                      color: Colors.blue,
                    ),
                  ],
                  text: 'Unirse a Sala',
                  fontSize: 70,
                ),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Tu apodo',
                  // neon: true, // Agregado para efecto neon
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextField(
                  controller: _roomIdController,
                  hintText: 'ID de la Sala',
                  // neon: true, // Agregado para efecto neon
                ),
                SizedBox(height: size.height * 0.045),
                CustomButton(
                  onTap: () => _socketMethods.joinRoom(
                    _nameController.text,
                    _roomIdController.text,
                  ),
                  text: 'Unirse',
                  neon: true, // Agregado para efecto neon
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
