import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/dialouge/toast_message.dart';
import 'package:kwasi/pages/create_profile/presentation/provider/create_profile_provider.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:kwasi/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/images.dart';
import '../../../../utils/screen_sizes.dart';
import 'age_drop_down.dart';

class CreateProfileContent extends StatefulWidget {
  const CreateProfileContent({super.key});

  @override
  State<CreateProfileContent> createState() => _CreateProfileContentState();
}

class _CreateProfileContentState extends State<CreateProfileContent> {
  final PageController controller = PageController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController userAgeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateProfileProvider>(context);
    return PageView.builder(
        controller: controller,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          provider.changeIndex(value);
          debugPrint('index ${provider.currentIndex}');
        },
        itemBuilder: (context, index) {
          return Consumer<CreateProfileProvider>(
              builder: (context, provider, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (provider.currentIndex != 0)
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          if (provider.currentIndex == 0) {
                            AutoRouter.of(context).pop();
                          } else {
                            if (index == 0) {
                              AutoRouter.of(context).pop();
                            } else {
                              controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.blackColor,
                        )),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.05,
                  ),
                  Image.asset(AppImages.personalInfoImg),
                  const SizedBox(
                    height: 60,
                  ),
                  AppTextStyle(
                      text: AppLocalizations.of(context)!.personalInformation,
                      fontSize: 20,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 30,
                  ),
                  buildDots(),
                  const SizedBox(
                    height: 60,
                  ),
                  index == 0
                      ? Column(children: [
                          LoginTextField(
                            controller: userNameController,
                            fieldName:
                                AppLocalizations.of(context)!.whatsYourName,
                            keyboard: TextInputType.name,
                            hintText:
                                AppLocalizations.of(context)!.enterYourName,
                          ),
                          const SizedBox(
                            height: 44,
                          ),
                          GestureContainer(
                              onPressed: () {
                                if (userNameController.text.isNotEmpty) {
                                  controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  );
                                } else {
                                  WarningHelper.showWarningToast(
                                      'Please ${AppLocalizations.of(context)!.enterYourName}',
                                      context);
                                }
                              },
                              buttonText:
                                  AppLocalizations.of(context)!.buttonContinue,
                              heroTag: 'create_profile')
                        ])
                      : index == 1
                          ? Column(children: [
                              AgeChooseDrop(
                                controller: userAgeController,
                              ),
                              const SizedBox(
                                height: 44,
                              ),
                              GestureContainer(
                                  onPressed: () {
                                    if (userAgeController.text.isNotEmpty) {
                                      controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                      );
                                    } else {
                                      WarningHelper.showWarningToast(
                                          'Please ${AppLocalizations.of(context)!.selectYourAge}',
                                          context);
                                    }
                                  },
                                  buttonText: AppLocalizations.of(context)!
                                      .buttonContinue,
                                  heroTag: 'age')
                            ])
                          : index == 2
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      AppTextStyle(
                                          text: AppLocalizations.of(context)!
                                              .whichAreYou,
                                          fontSize: 18,
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w200),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Consumer<CreateProfileProvider>(
                                          builder: (context, provider, child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 'Male',
                                                  groupValue:
                                                      provider.isSelected,
                                                  activeColor:
                                                      AppColors.blackColor,
                                                  onChanged: (value) {
                                                    provider
                                                        .changeValue(value!);
                                                  },
                                                ),
                                                AppTextStyle(
                                                    text: AppLocalizations.of(
                                                            context)!
                                                        .male,
                                                    fontSize: 18,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 'Female',
                                                  groupValue:
                                                      provider.isSelected,
                                                  activeColor:
                                                      AppColors.blackColor,
                                                  onChanged: (value) {
                                                    provider
                                                        .changeValue(value!);
                                                  },
                                                ),
                                                AppTextStyle(
                                                    text: AppLocalizations.of(
                                                            context)!
                                                        .female,
                                                    fontSize: 18,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 100,
                                            )
                                          ],
                                        );
                                      }),
                                      const SizedBox(
                                        height: 44,
                                      ),
                                      Consumer<CreateProfileProvider>(
                                          builder: (context, provider, child) {
                                        return GestureContainer(
                                            isLoading:
                                                provider.isCreatingProfile,
                                            onPressed: () {
                                              if (provider
                                                  .isSelected.isNotEmpty) {
                                                provider
                                                    .createProfile(
                                                        userName:
                                                            userNameController
                                                                .text,
                                                        userAge:
                                                            userAgeController
                                                                .text,
                                                        context: context,
                                                        userGender:
                                                            provider.isSelected)
                                                    .then((value) {
                                                  AutoRouter.of(context)
                                                      .pushAndPopUntil(
                                                          predicate: (route) =>
                                                              false,
                                                          SelectLanguagePageRoute());
                                                });
                                              } else {
                                                WarningHelper.showWarningToast(
                                                    'Please select your gender',
                                                    context);
                                              }
                                            },
                                            buttonText:
                                                AppLocalizations.of(context)!
                                                    .buttonContinue,
                                            heroTag: 'language');
                                      })
                                    ])
                              : const SizedBox()
                ],
              ),
            );
          });
        });
  }

  Widget buildDots() {
    return Consumer<CreateProfileProvider>(builder: (context, value, child) {
      return SizedBox(
        height: 10,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(2),
              child: AnimatedContainer(
                height: 5,
                width: value.currentIndex == index ? 28 : 5,
                decoration: BoxDecoration(
                  color: value.currentIndex == index
                      ? AppColors.greyColor
                      : AppColors.greyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                duration: const Duration(milliseconds: 700),
              ),
            );
          }),
        ),
      );
    });
  }
}
