import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

enum _SelectedTab { Home, Favorite, Add, Search, Person }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedTab = _SelectedTab.Home;

  void _handleIndexChanged(int i) {
    _pageController.animateToPage(i,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  final _pageController = PageController();

  final _pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Favorite')),
    Center(child: Text('Add')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          _selectedTab.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: SvgPicture.asset(
              'assets/images/logo/logo.svg',
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.srcATop),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      endDrawer: const Drawer(),
      drawer: const Drawer(),
      extendBody: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FittedBox(
        child: Badge(
          label: const Text('4'),
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.all(2),
          child: FloatingActionButton(
            // Your actual Fab
            focusElevation: 0,
            highlightElevation: 0,
            hoverElevation: 0,
            onPressed: () {},
            elevation: 0,
            tooltip: 'Chat',
            backgroundColor: Theme.of(context)
                .floatingActionButtonTheme
                .backgroundColor!
                .withBlue(160)
                .withOpacity(0.75),
            child: const Icon(IconlyBold.chat, size: 30),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          indicatorColor:
              Theme.of(context).colorScheme.inversePrimary.withBlue(160),
          unselectedItemColor: Colors.black54,
          backgroundColor:
              Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
          paddingR: const EdgeInsets.symmetric(horizontal: 20),
          marginR: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          onTap: _handleIndexChanged,
          enableFloatingNavBar: true,
          borderRadius: 25,
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.black,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: Colors.black,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: IconlyBold.plus,
              unselectedIcon: IconlyLight.plus,
              selectedColor: Colors.black,
            ),

            /// Search
            CrystalNavigationBarItem(
                icon: IconlyBold.search,
                unselectedIcon: IconlyLight.search,
                selectedColor: Colors.black),

            /// Profile
            CrystalNavigationBarItem(
              icon: IconlyBold.user_2,
              unselectedIcon: IconlyLight.user,
              selectedColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
