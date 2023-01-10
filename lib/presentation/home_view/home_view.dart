import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task9_1/domain/models/bottom_sheet_model/bottom_sheet_model.dart';
import 'package:task9_1/domain/models/expert_model/expert_model.dart';
import 'package:task9_1/presentation/home_view/cubit/cubit.dart';
import 'package:task9_1/presentation/home_view/cubit/states.dart';
import 'package:task9_1/utilities/resources/color_manager.dart';
import 'package:task9_1/utilities/resources/font_manager.dart';
import 'package:task9_1/utilities/resources/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, states) {},
        builder: (context, states) => Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p18,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text(
                              "Recommended Experts",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            trailing: Icon(FontAwesomeIcons.ellipsis, color: ColorManager.grey),
                            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8,
                              vertical: AppPadding.p14,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: HomeCubit.get(context)
                                    .experts
                                    .map(
                                      (e) => Container(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        margin: const EdgeInsets.all(
                                          AppMargin.m4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorManager.grey.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            AppSize.s14,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(AppPadding.p8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Image.asset(
                                                e.photo,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: AppSize.s6,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        e.isFavorite
                                                            ? FontAwesomeIcons.solidStar
                                                            : FontAwesomeIcons.star,
                                                        size: AppSize.s14,
                                                        color: ColorManager.gold,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                                                        child:
                                                            Text(e.rate, style: Theme.of(context).textTheme.bodyMedium),
                                                      ),
                                                      const Spacer(),
                                                      GestureDetector(
                                                        child: Icon(
                                                          FontAwesomeIcons.solidHeart,
                                                          size: AppSize.s14,
                                                          color: e.isFavorite ? ColorManager.error : ColorManager.grey2,
                                                        ),
                                                        onTap: ()=>HomeCubit.get(context).toggleFavoriteByItsName(title: e.name),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: AppSize.s6,
                                                  ),
                                                  Text(
                                                    e.name,
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                          fontSize: FontSize.s14,
                                                        ),
                                                  ),
                                                  const SizedBox(
                                                    height: AppSize.s6,
                                                  ),
                                                  Text(
                                                    e.type,
                                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                          fontSize: FontSize.s12,
                                                        ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSize.s12),
                          ListTile(
                            leading: Text(
                              "Online Experts",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            trailing: Icon(FontAwesomeIcons.ellipsis, color: ColorManager.grey),
                            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8,
                              vertical: AppPadding.p14,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: dummyExperts.experts
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.only(right: AppPadding.p16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: AppSize.s66,
                                                  height: AppSize.s66,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(e.photo),
                                                    ),
                                                  ),
                                                ),
                                                if (e.isOnline)
                                                  Positioned(
                                                    top: AppSize.s1,
                                                    right: AppSize.s1,
                                                    child: Container(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(height: AppSize.s5),
                                            Text(
                                              e.name,
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                    fontSize: FontSize.s12,
                                                    color: const Color(0xff777d80),
                                                  ),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.04,
            minChildSize: 0.04,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Center(
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Color(0xffd8d8d8),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                            width: AppSize.s30,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSize.s14),
                      ...dummyBottomSheets.bottomSheetItems
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(AppPadding.p16),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xffcfd9de)),
                                    borderRadius: BorderRadius.circular(AppSize.s14)),
                                child: ListTile(
                                  title: Text(
                                    e.title,
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          fontSize: FontSize.s14,
                                        ),
                                  ),
                                  subtitle: Text(
                                    e.subTitle,
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          fontSize: FontSize.s12,
                                          color: const Color(0xff777d80),
                                        ),
                                  ),
                                  leading: Image.asset(e.photo),
                                  trailing: Image.asset("asset/icons/arrow.png"),
                                ),
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
