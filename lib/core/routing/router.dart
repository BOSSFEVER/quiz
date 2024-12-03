import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routing/routes.dart';
import 'package:quiz/menu/views/screens/home/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: Routes.settings,
          builder: (context, state) => const OtherScreen(),
        ),
        GoRoute(
          path: Routes.join,
          builder: (context, state) => const OtherScreen(),
        ),
        GoRoute(
          path: Routes.create,
          builder: (context, state) => const OtherScreen(),
        ),
        GoRoute(
          path: Routes.host,
          builder: (context, state) => const OtherScreen(),
        ),
      ],
    ),
  ],
);

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GoRouter.of(context).state!.uri.toString()),
        leading: context.canPop() ? IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)) : SizedBox(),
      ),
      body: Placeholder(),
    );
  }
}
