import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';
import '../../../../../shared/shared.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // Wait a bit to show splash (optional)
    await Future.delayed(const Duration(seconds: 2));

    final session = Supabase.instance.client.auth.currentSession;

    if (mounted) {
      if (session != null && !session.isExpired) {
        context.go(RoutePath.home);
      } else {
        context.go(RoutePath.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                PhosphorIcons.bookOpenText(PhosphorIconsStyle.regular),
                size: 50.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'BookFlow',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 8.h),
            Text(
              AppLocalizations.of(context)!.digitalLibrary,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 48.h),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
