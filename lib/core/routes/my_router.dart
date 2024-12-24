import 'package:flutter_ca/features/profile/presentation/pages/all_user_page.dart';
import 'package:flutter_ca/features/profile/presentation/pages/detail_user_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  get router => GoRouter(initialLocation: '/', routes: [
        GoRoute(
            path: '/',
            name: 'all_user',
            pageBuilder: (context, state) => const NoTransitionPage(
                  child: AllUserPage(),
                ),
            routes: [
              GoRoute(
                path: '/detail-user',
                name: 'detail_user',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: DetailUserPage(),
                ),
              ),
            ])
      ]);
}
