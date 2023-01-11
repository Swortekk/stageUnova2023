import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            color: Colors.blue,
          ),
          const Text(
            "Asynconf 2022",
            style: TextStyle(fontSize: 42, fontFamily: 'Poppins'),
          ),
          const Text(
            "Salon virtuel de l'informatique du 27 au 29 octobre 2022",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
        ],
      ),
    );
  }
}
