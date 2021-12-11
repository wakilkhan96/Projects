import 'package:flutter/material.dart';

class ShadedBackgroundImage extends StatelessWidget {
  // const BackgroundImage({required this.image,});
  const ShadedBackgroundImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        // begin: Alignment.bottomCenter, //preset
        // end: Alignment.center, //preset
        begin: Alignment.center, //preset
        end: Alignment.topCenter, //preset
        //colors: [Colors.black, Colors.transparent], //preset
        colors: [Colors.white54, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.white10, BlendMode.darken), //preset
          ),
        ),
      ),
    );
  }
}
