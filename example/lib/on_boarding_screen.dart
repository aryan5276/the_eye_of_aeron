import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pytorch_lite_example/animated_btn.dart';
import 'package:pytorch_lite_example/asset_location.dart';
import 'package:pytorch_lite_example/choose_demo.dart';
import 'package:pytorch_lite_example/constants.dart';
import 'package:rive/rive.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool success = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool onLastPage = false;

  late RiveAnimationController _btnAnimationController;
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger error;
  late SMITrigger successSMIT;
  late SMITrigger reset;

  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    successSMIT = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void singIn(BuildContext context) async {
    // confetti.fire();
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (true) {
          successSMIT.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();
              // Navigate & hide confetti
              Future.delayed(const Duration(seconds: 1), () async {
                setState(() {
                  showSpinner = true;
                });

                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChooseDemo(),
                  ),
                );
              });
            },
          );
        }
      },
    );
  }

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);

    super.initState();
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: screenWidth! * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset(backgroundSpline),
          ),
          Positioned(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10))),
          RiveAnimation.asset(riveAnimation),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30,
              sigmaY: 30,
            ),
            child: const SizedBox(),
          )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 260,
                    child: Text("The Eye of Aeron",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 60,
                            height: 1.2,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "The Eye of Aeron is computer vision software that assists in detecting UAVs in the sky using your phone's camera. It has been developed by fine-tuning a YOLOv8 model with custom classes. The software can not only detect UAVs in the sky but also classify them into various categories, such as multi-rotor, fixed-wing, single rotor, VTOL, and even birds.",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        singIn(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) => const ChooseDemo())));
                      }),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          isShowLoading
              ? CustomPositioned(
                  child: RiveAnimation.asset(
                    'assets/RiveAssets/check.riv',
                    fit: BoxFit.cover,
                    onInit: _onCheckRiveInit,
                  ),
                )
              : const SizedBox(),
          isShowConfetti
              ? CustomPositioned(
                  scale: 6,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv",
                    onInit: _onConfettiRiveInit,
                    fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({key, this.scale = 1, required this.child});

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 130,
            width: 130,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
