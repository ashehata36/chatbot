import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task9_1/presentation/home_view/cubit/cubit.dart';
import 'package:task9_1/utilities/resources/color_manager.dart';
import 'package:task9_1/utilities/resources/font_manager.dart';
import 'package:task9_1/utilities/resources/values_manager.dart';

import '../home_view/cubit/states.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, states) {},
        builder: (context, states) => Scaffold(
          body: HomeCubit.get(context).experts.where((element) => element.isFavorite).isEmpty
              ? const SizedBox()
              : Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "Favorites Experts",
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
                              .where((element) => element.isFavorite)
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
                                                  e.isFavorite ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                                                  size: AppSize.s14,
                                                  color: ColorManager.gold,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                                                  child: Text(e.rate, style: Theme.of(context).textTheme.bodyMedium),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  child: Icon(
                                                    FontAwesomeIcons.solidHeart,
                                                    size: AppSize.s14,
                                                    color: e.isFavorite ? ColorManager.error : ColorManager.grey2,
                                                  ),
                                                  onTap: () =>
                                                      HomeCubit.get(context).toggleFavoriteByItsName(title: e.name),
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
                  ],
                ),
        ),
      ),
    );
  }
}
