import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

import 'infrastructure/datasources/local_video_datasource_impl.dart';
import 'infrastructure/repositories/video_posts_repository_impl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostsRepositoryImpl( // Repositorio implmentando los métodos del datasource
      videosDatasource: LocalVideoDatasource()
    );


    return MultiProvider(
      providers:[
        ChangeNotifierProvider( create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}