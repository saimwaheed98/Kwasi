import 'dart:developer';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../data/model/language_model.dart';
import '../provider/languges_provider.dart';

class WriteLangContainer extends StatefulWidget {
  const WriteLangContainer({super.key});

  @override
  State<WriteLangContainer> createState() => _WriteLangContainerState();
}

class _WriteLangContainerState extends State<WriteLangContainer> {
  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none);

  final controller = TextEditingController();
  final translationController = TextEditingController();
  List<String> imagesUrl = [];

  SpeechToText speech = SpeechToText();
  String recognizedWords = '';

  FlutterTts textToSpeech = FlutterTts();

  @override
  void initState() {
    translationController.clear();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
     var provider = Provider.of<LangugesProvider>(context,listen: false);
     provider.getTranslate(const LanguageModel());
     provider.writingFieldController.clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 7,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Consumer<LangugesProvider>(builder: (context, provider, child) {
                  return TextFormField(
                    controller: provider.writingFieldController,
                    maxLength: null,
                    maxLines: null,
                    cursorColor: AppColors.primaryColor,
                    textInputAction: TextInputAction.send,
                    scrollController: ScrollController(keepScrollOffset: true),
                    style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.7),
                        fontSize: 20,
                        fontFamily: "oktaRound",
                        fontWeight: FontWeight.w600),
                    onChanged: (value) {
                      if(value.isNotEmpty){
                        provider.getLanguge(value);
                      }else{
                        provider.getTranslate(const LanguageModel());
                      }
                    },
                    onFieldSubmitted: (value) {
                      if(value.isNotEmpty){
                        provider.getLanguge(value);
                      }else{
                        provider.getTranslate(const LanguageModel());
                      }
                    },
                    scribbleEnabled: true,
                    decoration: InputDecoration(
                      constraints:
                          const BoxConstraints(minHeight: 140, maxHeight: 140),
                      fillColor: AppColors.whiteColor,
                      hintText: AppLocalizations.of(context)!.enterText,
                      hintStyle: TextStyle(
                          color: AppColors.blackColor.withOpacity(0.4),
                          fontSize: 20,
                          fontFamily: "oktaRound",
                          fontWeight: FontWeight.w400),
                      filled: true,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      disabledBorder: border,
                    ),
                  );
                }),
                Divider(
                  color: AppColors.greyColor.withOpacity(0.3),
                  endIndent: 15,
                  indent: 15,
                ),
                Consumer<LangugesProvider>(builder: (context, provider, child) {
                  String value = getTranslatedWord(
                      provider.selectedTranslatedLanguages,
                      provider.translatedText);
                  translationController.text =
                  (value.isEmpty && controller.text.isNotEmpty) ? AppLocalizations.of(context)!.currentlyUnAvailable : value;
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: translationController,
                        maxLength: null,
                        maxLines: null,
                        readOnly: true,
                        style: TextStyle(
                            color: AppColors.blackColor.withOpacity(0.7),
                            fontSize: 20,
                            fontFamily: "oktaRound",
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                              minHeight: 140, maxHeight: 140),
                          fillColor: AppColors.whiteColor,
                          hintText:
                              AppLocalizations.of(context)!.translatedText,
                          hintStyle: TextStyle(
                              color: AppColors.blackColor.withOpacity(0.4),
                              fontSize: 20,
                              fontFamily: "oktaRound",
                              fontWeight: FontWeight.w400),
                          filled: true,
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          disabledBorder: border,
                        ),
                      ));
                }),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 37,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: GestureDetector(
                onTapDown: (value) async {
                  var available = await speech.initialize();
                  if (available) {
                    log("available");
                    speech.listen(
                      onResult: (result) {
                        setState(() {
                          log("available: ${controller.text}");
                          controller.text = result.recognizedWords;
                          log("words ${result.recognizedWords}");
                        });
                      },
                    );
                  }
                },
                onTapUp: (value) {
                  setState(() {
                    speech.stop();
                  });
                },
                child: Container(
                  height: 76,
                  width: 76,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                  ),
                  child: Image.asset(AppImages.voiceIcon),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Consumer<LangugesProvider>(builder: (context, provider, child) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Container(
                  height: 76,
                  width: 76,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        String value = getTranslatedWord(
                            provider.selectedTranslatedLanguages,
                            provider.translatedText);
                        // speakText(value);
                        provider.playAudio(
                          context
                        );
                      },
                      icon: provider.isPlay
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ))
                          : Image.asset(AppImages.soundIcon)),
                ),
              );
            }),
          ],
        ),
        if (imagesUrl.isNotEmpty)
          SizedBox(
            height: 200,
            width: 200,
            child: Image.network(imagesUrl.first),
          ),
      ],
    );
  }

  void speakText(String value) async {
    await textToSpeech.setLanguage('en-US');
    await textToSpeech.getVoices.then((value) {
      debugPrint(value.toString());
    });
    await textToSpeech.setPitch(2.0);
    await textToSpeech.speak(value);
    await textToSpeech.awaitSpeakCompletion(true);
  }

  String getTranslatedWord(String selectedText, LanguageModel lang) {
    if (selectedText == "Bulu") {
      return lang.bulu;
    } else if (selectedText == "English") {
      return lang.english;
    } else if (selectedText == "French") {
      return lang.french;
    } else if (selectedText == "Duala") {
      return lang.duala;
    } else if (selectedText == "Ghomala") {
      return lang.ghomla;
    } else {
      return lang.english;
    }
  }
}
