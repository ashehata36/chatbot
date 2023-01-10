import 'package:flutter/material.dart';

import 'package:task9_1/utilities/resources/font_manager.dart';
import 'package:task9_1/utilities/resources/values_manager.dart';
import 'package:task9_1/utilities/routes.dart';

import '../../utilities/resources/color_manager.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSize.s30),
              Flexible(
                fit: FlexFit.tight,
                child: Image.asset(
                  "asset/images/get_start_bg.png",
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Image.asset(
                  "asset/images/get_start_img2.png",
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p27),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.chatPageRoute),
                    child: const FittedBox(
                      child: Text("Next"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("asset/icons/lang_icon.png"),
                  Text(
                    " English",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
