import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tech_test_elabram/domain/entities/news.dart';
import 'package:tech_test_elabram/injection.dart' as di;
import 'package:tech_test_elabram/presentation/pages/news_page.dart';

import 'presentation/bloc/news_bloc.dart';
import 'presentation/pages/news_detail_page.dart';
import 'utils/utils.dart';

void main() {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return BlocProvider(
      create: ((context) => di.locator<NewsBloc>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coding Test Flutter',
        home: const NewsPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const NewsPage());
            case NewsDetailPage.routeName:
              return MaterialPageRoute(
                builder: (_) => NewsDetailPage(news: args as News?),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
