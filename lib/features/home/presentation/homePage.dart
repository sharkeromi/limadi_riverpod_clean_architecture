import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:limadi_riverpod_clean_architecture/config/theme/colors.dart';
import 'package:limadi_riverpod_clean_architecture/config/theme/styles.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/const.dart';
import 'package:limadi_riverpod_clean_architecture/core/widgets/bottom_nav_bar.dart';
import 'package:limadi_riverpod_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/presentation/providers/auth_providers.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userEntityProvider);
    return Stack(
      children: [
        Container(
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
                  title: "Facebook",
                  titleColor: cPrimaryColor,
                  hasBackButton: false,
                  isCenterTitle: false,
                  onBack: () {},
                ),
              ),
              bottomNavigationBar: CustomBottomNavBar(
                width: width,
                isFirstButtonClicked: true,
                isFifthButtonClicked: false,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kH8sizedBox,
                    Container(
                      height: 100,
                      width: width - 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: cBlackColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: k12Padding),
                              child: ClipOval(
                                child: Container(
                                  height: h40,
                                  width: h40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    user!.profilePicture.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                user.fullName!,
                                style: semiBold18TextStyle(cBlackColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        // if (Get.find<PostReactionController>().isGiftStarLoading.value || Get.find<PendentBadgesController>().isBuyBadgeLoading.value)
        //   Positioned(
        //     child: CommonLoadingAnimation(
        //       onWillPop: () async {
        //         if (Get.find<PostReactionController>().isGiftStarLoading.value || Get.find<PendentBadgesController>().isBuyBadgeLoading.value) {
        //           return false;
        //         }
        //         return true;
        //       },
        //     ),
        //   ),
      ],
    );
  }
}
