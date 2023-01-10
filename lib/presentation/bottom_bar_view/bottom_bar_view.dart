import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task9_1/presentation/bottom_bar_view/cubit/cubit.dart';
import 'package:task9_1/presentation/bottom_bar_view/cubit/states.dart';
import 'package:task9_1/presentation/profile_view/profile_view.dart';
import 'package:task9_1/presentation/favorites_view/favorites_view.dart';
import 'package:task9_1/presentation/home_view/home_view.dart';
import 'package:task9_1/presentation/news_view/news_view.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  final _pageOptions = [
    HomeView(),
    FavoritesView(),
    NewsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IndexCubit>(
      create: (context) => IndexCubit(),
      child: BlocConsumer<IndexCubit, IndexStates>(
        listener: (context, states) {},
        builder: (context, states) => Scaffold(
          appBar: AppBar(
            leading: const DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("asset/images/profile_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [Image.asset("asset/icons/search.png")],
            title: Image.asset("asset/images/logo.png"),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(3.0), // here the desired height
                child: Divider()),
          ),
          body: _pageOptions[IndexCubit.get(context).index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: IndexCubit.get(context).index,
            onTap: IndexCubit.get(context).setIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Image.asset("asset/icons/bottom1.png"), label: ""),
              BottomNavigationBarItem(icon: Image.asset("asset/icons/star.png"), label: ""),
              BottomNavigationBarItem(icon: Image.asset("asset/icons/bm3.png"), label: ""),
              BottomNavigationBarItem(icon: Image.asset("asset/icons/bm4.png"), label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
