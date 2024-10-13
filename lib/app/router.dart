import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:rickandmorty/views/characters_view/characters_view.dart';
import 'package:rickandmorty/views/favourites_view/favourites_view.dart';
import 'package:rickandmorty/views/locations_view/locations_view.dart';
import 'package:rickandmorty/views/sections_view/sections_view.dart';

final _routerkey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes();

  static const String characters = '/';
  static const String favourites = '/favourites';
  static const String locations = '/locations';
  static const String sections = '/sections';
}

final router = GoRouter(
    navigatorKey: _routerkey,
    initialLocation: AppRoutes.characters,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppView(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.characters,
                builder: (context, state) => const CharactersView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.favourites,
                builder: (context, state) => const FavouritesView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.locations,
                builder: (context, state) => const LocationsView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.sections,
                builder: (context, state) => const SectionsView(),
              ),
            ],
          ),
        ],
      ),
    ]);
