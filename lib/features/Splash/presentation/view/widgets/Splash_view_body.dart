import 'package:book_app/core/utils/Go_router.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/features/Splash/presentation/view/widgets/slide_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slideAnim();
    animationController.forward();
    navigationToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.imagesLogo),
        SlideText(slideAnimation: slideAnimation)
      ],
    );
  }

  Future<Object?> navigationToHome() {
    return Future.delayed(
      const Duration(seconds: 3),
      () => GoRouter.of(context).push(
        navigateHome,
      ),
    );
  }

  Animation<Offset> slideAnim() {
    return slideAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
  }
}
