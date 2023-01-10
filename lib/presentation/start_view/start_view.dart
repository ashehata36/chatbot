import 'package:flutter/material.dart';

import 'package:task9_1/utilities/resources/color_manager.dart';
import 'package:task9_1/utilities/resources/font_manager.dart';
import 'package:task9_1/utilities/resources/values_manager.dart';
import 'package:task9_1/utilities/routes.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("asset/images/start_background.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 184,
                    child: Image.asset(
                      "asset/images/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: AppSize.s22),
                  Text(
                    "Expert From Every Planet",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: const Color(0xff5f5f5f),
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p27),
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.getStartPageRoute),
                        child: const Text("Get Started"),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: FontSize.s12,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          " SignUp",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: FontSize.s12,
                            color: ColorManager.primary,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s8),
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
            )
          ],
        ),
      ),
    );
  }
}
