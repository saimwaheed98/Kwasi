import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import 'package:kwasi/pages/profile/provider/profile_pick_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/screen_sizes.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';

class ProfileImageDes extends StatelessWidget {
  const ProfileImageDes({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 160,
          width: getWidth(context),
        ),
        Container(
          height: 130,
          width: getWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff053405).withOpacity(0.1),
                blurRadius: 124,
                offset: const Offset(0, 34),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Column(
            children: [
              Stack(
                children: [
                  Consumer<ProfilePickProvider>(
                      builder: (context, provider, child) {
                    return Container(
                      height: 95,
                      width: 103,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Auth.userData.photoURL.isEmpty
                            ? AppColors.primaryColor.withOpacity(0.3)
                            : AppColors.whiteColor,
                        border: Border.all(
                          color: AppColors.whiteColor,
                          width: 2,
                        ),
                      ),
                      child: Auth.userData.photoURL.isNotEmpty
                          ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: Auth.userData.photoURL,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context,value,progress){
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context,value,error){
                              return const Icon(Icons.error);
                            },
                          )
                      )
                          : provider.image != null
                              ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(provider.image ?? File(""),fit: BoxFit.cover,))
                              : SizedBox(
                                  width: 90,
                                  child: AppTextStyle(
                                    text: Auth.userData.username,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                    );
                  }),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    child: InkWell(
                      onTap:(){
                        Provider.of<ProfilePickProvider>(context,listen: false).pickImage(context);
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor.withOpacity(0.23),
                          border: Border.all(
                            color: AppColors.whiteColor.withOpacity(0.4),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppColors.primaryColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextStyle(
                text: Auth.userData.username,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
