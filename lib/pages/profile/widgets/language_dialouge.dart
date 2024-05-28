import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kwasi/localization/provider/change_lang_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';

class LanguageDialouge extends StatefulWidget {
  const LanguageDialouge({super.key});

  @override
  State<LanguageDialouge> createState() => _LanguageDialougeState();
}

class _LanguageDialougeState extends State<LanguageDialouge> {

  String selectedLang = "en";

  @override
  void initState() {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      var provider = Provider.of<ChangeLangProvider>(context,listen: false);
      provider.getLanguage().then((value) {
        if(provider.locale.languageCode == "fr" ){
          selectedLang = "fr";
        }else{
          selectedLang = "en";
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLangProvider>(context);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
                provider.changeLanguage(const Locale("fr"));
                setState(() {
                  selectedLang = "fr";
                });
              },
              child: Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    color: selectedLang == "fr" ? AppColors.primaryColor.withOpacity(0.52) : AppColors.blackColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppTextStyle(
                        text: "French",
                        fontSize: 15,
                        color: Color(0xff4F4F4F),
                        fontWeight: FontWeight.w700),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                provider.changeLanguage(const Locale("en"));
                setState(() {
                  selectedLang = "en";
                });
              },
              child: Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    color: selectedLang == "en" ? AppColors.primaryColor.withOpacity(0.52) : AppColors.blackColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppTextStyle(
                        text: "English",
                        fontSize: 15,
                        color: Color(0xff4F4F4F),
                        fontWeight: FontWeight.w700),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
