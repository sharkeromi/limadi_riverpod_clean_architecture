import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:limadi_riverpod_clean_architecture/config/theme/colors.dart';
import 'package:limadi_riverpod_clean_architecture/config/theme/styles.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/const.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/functions.dart';
import 'package:limadi_riverpod_clean_architecture/core/widgets/bottom_nav_bar.dart';
import 'package:limadi_riverpod_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:limadi_riverpod_clean_architecture/core/widgets/custom_button.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/presentation/providers/auth_providers.dart';

class Profile extends ConsumerWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userEntityProvider);
    return Container(
      color: cWhiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: cBackgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kAppBarSize),
            //* info:: appBar
            child: CustomAppBar(
              appBarColor: cWhiteColor,
              title: '${user!.fullName}',
              hasBackButton: true,
              isCenterTitle: true,
              onBack: () {},
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
                width: width,
                isFirstButtonClicked: false,
                isFifthButtonClicked: true,
              ),
          body: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 225,
                        color: cWhiteColor,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
                          width: width,
                          decoration: const BoxDecoration(color: cBlackColor, border: Border(bottom: BorderSide(color: cLineColor))),
                          child: Image.network(
                            user.coverPhoto.toString(),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: isDeviceScreenLarge() ? kProfileImageSize : (kProfileImageSize - h10),
                                width: isDeviceScreenLarge() ? kProfileImageSize : (kProfileImageSize - h10),
                                decoration: BoxDecoration(
                                  color: cBlackColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: cWhiteColor.withAlpha(500), width: 2),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    user.profilePicture.toString(),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 6,
                              bottom: 10,
                              child: TextButton(
                                style: kTextButtonStyle,
                                onPressed: () {},
                                child: Container(
                                  height: h28,
                                  width: h28,
                                  decoration: BoxDecoration(
                                    color: cGreyBoxColor,
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(
                                      color: cLineColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.camera,
                                    color: cBlackColor,
                                    size: kIconSize14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 16,
                        bottom: 60,
                        child: TextButton(
                          style: kTextButtonStyle,
                          onPressed: () {},
                          child: Container(
                            height: h28,
                            width: h28,
                            decoration: BoxDecoration(
                              color: cGreyBoxColor,
                              borderRadius: BorderRadius.circular(26),
                              border: Border.all(
                                color: cLineColor,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera,
                              color: cBlackColor,
                              size: kIconSize14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: cWhiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kH10sizedBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                          child: Text(
                            '${user.firstName} ${user.lastName}',
                            style: medium24TextStyle(cBlackColor),
                          ),
                        ),
                        kH12sizedBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomElevatedButton(
                                label: "Add Selfie",
                                buttonHeight: 32,
                                buttonWidth: 130,
                                prefixIcon: Icons.camera_alt_rounded,
                                textStyle: semiBold16TextStyle(cWhiteColor),
                                prefixIconSize: screenWiseSize(kIconSize18, 4),
                                onPressed: () {},
                              ),
                              kW16sizedBox,
                              CustomElevatedButton(
                                label: "Edit Profile",
                                onPressed: () {},
                                prefixIcon: Icons.edit,
                                prefixIconColor: cPrimaryColor,
                                prefixIconSize: screenWiseSize(kIconSize18, 4),
                                buttonHeight: 32,
                                buttonWidth: 130,
                                buttonColor: cWhiteColor,
                                textStyle: semiBold16TextStyle(cPrimaryColor),
                              )
                            ],
                          ),
                        ),
                        kH16sizedBox,
                      ],
                    ),
                  ),
                  kH12sizedBox,
                  kHBottomSizedBox
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
