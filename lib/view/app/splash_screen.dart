part of '../../utils/import/app_import.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.blueGrey,
      splashIconSize: 200,
      splashTransition: SplashTransition.rotationTransition,
      splash: const CircleAvatar(
        radius: 90,
        backgroundImage: AssetImage("assets/images/logo.png"),
      ),
      nextScreen: const AppHomePage(),
    );
  }
}
