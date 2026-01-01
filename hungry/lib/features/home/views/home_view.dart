import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../producet/views/product_details_view.dart';
import '../widgets/card_item.dart';
import '../widgets/food_catrgory.dart';
import '../widgets/search_field.dart';
import '../widgets/user_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = [
    'All',
    'Combo',
    'Sliders',
    'Classic',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            /// header
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              toolbarHeight: 140,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserHeader(),
                      const Gap(10),
                      const SearchField(),
                    ],
                  ),
                ),
              ),
            ),

            /// Category
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: FoodCategory(selectedIndex: selectedIndex, category: category)
              ),
            ),

            /// GridView
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                      (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return const ProductDetailsView();
                      }));
                    },
                    child: const CardItem(
                      image: 'assets/test/test.png',
                      text: 'Cheeseburger',
                      desc: 'Wendy\'s Burger',
                      rate: '4.9',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
