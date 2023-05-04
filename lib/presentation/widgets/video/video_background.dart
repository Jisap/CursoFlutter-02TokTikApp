import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {

  final List<Color> colors; 
  final List<double> stops; // Recibimos como queremos que sea el gradiente, donde empieza y donde termina.

  const VideoBackground({
    super.key,
    this.colors = const[  // Lista de colores del gradiente por defecto
      Colors.transparent, 
      Colors.black87
    ],
    this.stops = const[0.0, 1.0]
  }):assert( colors.length == stops.length, 'Stops and Color must be same length' );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      )
    );
  }
}