import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState(); // Esta clase da lugar a un estado con el mismo nombre más el guión bajo
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  // Estado de FullScreenPlayer

  late VideoPlayerController controller; // Controles del video player bajo demanda

  @override
  void initState() {
    // Inicialización de los valores del controller
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override // Cuando no se use el widget se liberan recuros
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {                                            // Construimos un context
    return FutureBuilder(                                                         // basado en promesas
      future: controller.initialize(),                                            // de creación de un controlador del video player según valores iniciales
      builder: (context, snapshot) {                                              // y de construcción de un video player
        if (snapshot.connectionState != ConnectionState.done) {                   // ConnectionState hace referencia a si se reciben datos
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));  // Mientras se reciban datos se muestra el loading
        }
        return GestureDetector( // Detector de gestos del usuario
          onTap: (){
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
          child: AspectRatio(                                                       // El video player tendrá unas dimensiones
              aspectRatio: controller.value.aspectRatio,
              child: Stack(children: [                                              // Tendrá un controlador
                VideoPlayer(controller),
                //Gradiente
                VideoBackground(
                  stops: const [0.8, 1.0] // Los gradientes empiezan en 80% de la pantalla y terminan en el resto de la misma.
                ),
                //Texto
                Positioned(                                                         // y estará posicionado en la pantalla
                  bottom:50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)                     // La descripción estará en _videoCaption
                ),
              ])),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption; // Se recibe la descripción

  const _VideoCaption({
    required this.caption
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;                   // Tamaño de la descripción
    final titleStyle = Theme.of(context).textTheme.titleLarge;  // Estilo de la descripción

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines:2,
        style: titleStyle
      ),
    );
  }
}
