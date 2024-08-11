import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

enum _SelectedTab { Home, Favorite, Add, Search, Person }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        // TODO: ADD LOGO TO LEADING
        leading: Container(
          color: Colors.redAccent,
        ),
        actions: [CircleAvatar(backgroundColor: Colors.redAccent)],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      extendBody: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        child: FittedBox(
          child: Stack(
            alignment: Alignment(1.6, -1.5),
            children: [
              FloatingActionButton(
                // Your actual Fab
                onPressed: () {},
                elevation: 0,
                tooltip: 'Increment',
                child: const Icon(IconlyBold.chat, size: 30),
                backgroundColor: Theme.of(context)
                    .floatingActionButtonTheme
                    .backgroundColor!
                    .withBlue(160)
                    .withOpacity(0.75),
              ),
              Container(
                // This is your Badge
                child: Center(
                  // Here you can put whatever content you want inside your Badge
                  child: Text('4', style: TextStyle(color: Colors.white)),
                ),
                constraints: BoxConstraints(minHeight: 26, minWidth: 26),
                decoration: BoxDecoration(
                  // This controls the shadow
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.redAccent, // This would be color of the Badge
                ),
              ),
            ],
          ),
        ),
      ),
      // FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => const HomePage(),
      //     //   ),
      //     // );
      //   },
      //   elevation: 0,
      //   tooltip: 'Increment',
      //   child: const Icon(IconlyBold.chat, size: 30),
      //   backgroundColor: Theme.of(context)
      //       .floatingActionButtonTheme
      //       .backgroundColor!
      //       .withBlue(160)
      //       .withOpacity(0.75),
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          indicatorColor:
              Theme.of(context).colorScheme.inversePrimary.withBlue(160),
          unselectedItemColor: Colors.black54,
          backgroundColor:
              Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
          paddingR: const EdgeInsets.symmetric(horizontal: 10),
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
