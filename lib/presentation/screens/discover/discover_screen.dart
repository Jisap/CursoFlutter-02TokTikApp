import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen ({super.key});

  @override
  Widget build(BuildContext context) {

    final discoverProvider = context.watch<DiscoverProvider>();               // Estado del provider (Lista de videos locales)


    return Scaffold(
      body: discoverProvider.initialLoading
        ? const Center( child: CircularProgressIndicator(strokeWidth: 2))     // Loading
        : VideoScrollableView(videos: discoverProvider.videos)                // widget para mostrar un scroll de videos. Le pasamos la lista de videos
    );
  }
}