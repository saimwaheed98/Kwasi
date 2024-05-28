import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/onBoarding/presentation/components/on_boarding_data.dart';
import 'package:kwasi/pages/onBoarding/presentation/provider/google_sign_in_provider.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/images.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:kwasi/widgets/login_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with SingleTickerProviderStateMixin {
  final controller = OnBoardingData();
  final pageControllerImages = PageController();
  final pageControllerText = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    pageControllerImages.dispose();
    pageControllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (currentIndex == 1 || currentIndex == 0)
              const SizedBox(
                height: 50,
              ),
            images(),
            if (currentIndex == 1 || currentIndex == 0) buildDots(),
            if (currentIndex == 1 || currentIndex == 0)
              const SizedBox(
                height: 65,
              ),
            text(),
            if (currentIndex == 3)
              const SizedBox(
                height: 50,
              ),
            if (currentIndex == 1 || currentIndex == 0) nextButton(),
            if (currentIndex == 1 || currentIndex == 0)
              const SizedBox(
                height: 39,
              ),
            if (currentIndex == 1 || currentIndex == 0)
              TextButton(
                  onPressed: () {
                    AutoRouter.of(context).replace(const CreateProfileRoute());
                  },
                  child: AppTextStyle(
                    text: AppLocalizations.of(context)!.skip,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor.withOpacity(0.5),
                  )),
            // if (currentIndex == 2)
            //   Column(
            //     children: [
            //       LoginContainer(
            //           containerImg: AppImages.loginWithFacebook,
            //           onPressed: () {},
            //           buttonText: AppLocalizations.of(context)!.joinWithFacebook,
            //           heroTag: 'facebook'),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Consumer<GoogleSignInProvider>(
            //           builder: (context, googleSignIn, child) {
            //         return LoginContainer(
            //             containerImg: AppImages.loginWithGoogle,
            //             isLoading: googleSignIn.isCreatingProfile,
            //             onPressed: () {
            //               googleSignIn.googleSignIn(context);
            //             },
            //             buttonText: AppLocalizations.of(context)!.joinWithGoogle,
            //             heroTag: 'google');
            //       }),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       LoginContainer(
            //           containerImg: AppImages.createProfile,
            //           onPressed: () {
            //             AutoRouter.of(context).push(const CreateProfileRoute());
            //           },
            //           border: const BorderSide(
            //               color: AppColors.primaryColor, width: 1),
            //           buttonText: AppLocalizations.of(context)!.createProfile,
            //           heroTag: 'create_profile'),
            //     ],
            //   ),
            // const SizedBox(
            //   height: 20,
            // ),
            // if (currentIndex == 2)
            //   TextButton(
            //       onPressed: () {},
            //       child:  AppTextStyle(
            //         text: AppLocalizations.of(context)!.needHelp,
            //         fontSize: 17,
            //         fontWeight: FontWeight.w300,
            //         color: AppColors.blueColor,
            //       )),
            // const SizedBox(
            //   height: 28,
            // ),
          ],
        ),
      ),
    );
  }

  Widget images() {
    return Expanded(
      flex: 2,
      child: PageView.builder(
        controller: pageControllerImages,
        itemCount: controller.onBoardingData.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  controller.onBoardingData[index].imageData,
                  height: 220,
                  width: 240,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget text() {
    return Expanded(
      flex: 2,
      child: PageView.builder(
        controller: pageControllerText,
        itemCount: controller.onBoardingData.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Text(
            controller.onBoardingData[index].description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'oktaRound',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          );
        },
      ),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.onBoardingData.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: AnimatedContainer(
            height: 5,
            width: currentIndex == index ? 28 : 5,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.greyColor
                  : AppColors.greyColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            duration: const Duration(milliseconds: 700),
          ),
        );
      }),
    );
  }

  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureContainer(
        onPressed: () async {
          if(currentIndex == 0){

            pageControllerImages.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
            pageControllerText.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          }else{
            AutoRouter.of(context).replace(const CreateProfileRoute());
          }
        },
        buttonText: AppLocalizations.of(context)!.next,
        heroTag: 'on_boarding',
      ),
    );
  }
}
