import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formtas.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;  // Recibimos el video que se esta visualizando

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(                  // Damos contenido a las variables del _CustomIconButton
        value: video.likes, 
        iconColor: Colors.red,
        iconData: Icons.favorite,
      ),
      const SizedBox( height: 20 ),
      _CustomIconButton(
        value: video.views,
        iconData: Icons.remove_red_eye,
      ),
      const SizedBox(height: 20),
      SpinPerfect(
        infinite: true,
        duration: const Duration(seconds: 5),
        child: const _CustomIconButton(
          value: 0, 
          iconData: Icons.play_circle_outline,
        ),
      )
    ]);
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;          // Valor que va a mostrar.
  final IconData iconData;  // Icon
  final Color? color;       // Color

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor                                // Si el valor de iconColor es null, se asigna el valor de Colors.white (blanco).
    }): color = iconColor ?? Colors.white; // Si se proporciona un valor de iconColor, se usará ese valor en su lugar.
                                    
    
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        onPressed: () {}, 
        icon: Icon(iconData, color: color, size: 30,)),
      if(value > 0)
      Text(HumanFormats.humanReadbleNumber(value.toDouble()))
    ]);
  }
}
