import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveTestScreen extends StatefulWidget {
  const RiveTestScreen({super.key});

  @override
  State<RiveTestScreen> createState() => _RiveTestScreenState();
}

class _RiveTestScreenState extends State<RiveTestScreen> {

  SMIBool? isPressed;
  StateMachineController? _stateMachineController;

  void _onRiveInit(Artboard artboard){
    _stateMachineController = StateMachineController.fromArtboard(artboard, 'SMPoke');

    if (_stateMachineController != null) {
      artboard.addController(_stateMachineController!);
      isPressed = _stateMachineController!.findSMI('onPressed');
    }
  }

  void _animationTriggered(){
    setState(() {
      if (isPressed != null) {
        isPressed!.value = true;
      }
      Future.delayed(const Duration(seconds: 1), (){
        Navigator.pushReplacementNamed(context, 'pokedexMainScreen');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _animationTriggered,
        child:
          RiveAnimation.asset('./assets/rive/splash_screen_animation.riv',
            fit: BoxFit.cover,
            onInit: _onRiveInit,
            ),
        ),
    );
  }

  @override
  void dispose(){
    _stateMachineController?.dispose();
    super.dispose();
  }
}