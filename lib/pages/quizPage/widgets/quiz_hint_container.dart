import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../home/presentation/provider/languges_provider.dart';
import '../../learning_words/provider/learning_word_provider.dart';

class FishContainer extends StatelessWidget {
  const FishContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LangugesProvider>(builder: (context, provider, _) {
      return Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 303,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .006,
                    top: MediaQuery.of(context).size.height * .006),
                child: Text(
                  provider.questionName,
                  style: TextStyle(
                      color: AppColors.blackColor.withOpacity(0.7),
                      fontSize: 20,
                      fontFamily: "oktaRound",
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 2,
                thickness: 1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .21,
              ),
              // Container(
              //     padding:
              //         EdgeInsets.all(MediaQuery.of(context).size.width * .08),
              //     height: MediaQuery.of(context).size.height * .25,
              //     child: Image.asset(
              //       "assets/images/fish.png",
              //       fit: BoxFit.cover,
              //     )),
              Divider(
                color: Colors.grey.shade300,
                height: 2,
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .04,
                    bottom: MediaQuery.of(context).size.width * .04,
                    left: MediaQuery.of(context).size.width * .04,
                    right: MediaQuery.of(context).size.width * .04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.quizAnswer,
                      style: TextStyle(
                          color: AppColors.blackColor.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.width * .06,
                          fontFamily: "oktaRound",
                          fontWeight: FontWeight.w300),
                    ),
                    Consumer<LangugesProvider>(

                      builder: (context,provider,child) {
                        return InkWell(
                          onTap: () {
                            provider.playAudio(context);
                          },
                          child: provider.isPlay ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors.primaryColor,
                              strokeWidth: 1,
                            ),
                          ) : Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * .02),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(200)),
                              child: Image.asset(
                                "assets/icons/Volume_Up.png",
                                height: MediaQuery.of(context).size.width * .06,
                                width: MediaQuery.of(context).size.width * .06,
                              )),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
