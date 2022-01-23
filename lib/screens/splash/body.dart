import 'package:flutter/material.dart';
class SplashBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 200,
            width: 200,
            // decoration:  BoxDecoration(
            //   gradient: LinearGradient(
            //       colors: [HexColor('#40A2A6'),HexColor('#4CB8BA')]),
            //     // shape: BoxShape.circle,
            //     // color: Colors.white,
            // ),
            child: Center(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,),
            )),
          ),
        ),
      ],
    );

  }
}
