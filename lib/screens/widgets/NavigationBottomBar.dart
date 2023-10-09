import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/screens/home.dart';
import 'package:waridionline/screens/home/More.dart';
import 'package:badges/badges.dart' as badges;
import 'package:waridionline/screens/products/FiltersBottomSheet.dart';
import 'package:waridionline/screens/widgets/Homeappbar.dart';
import 'package:waridionline/screens/widgets/VendorGridView.dart';

import '../home/VendorsList.dart';
import '../models/user_model.dart';
import '../orders/OrderDetails.dart';
import '../orders/OrdersList.dart';
import 'SideBar.dart';

int currentPageIndex = 0;

class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({
    super.key,
  });

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: AppBar(
                backgroundColor: Colors.white,
                title: SizedBox(
                  height: 50,
                  // width: 200, // Adjust the width as needed
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/waridi.png', // Replace with the path to your logo image
                        width: 60, // Adjust the width as needed
                        height: 150, // Adjust the height as needed
                      ),
                      SizedBox(
                          width:
                              8), // Add spacing between logo and search field
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search by name',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Consumer<User>(
                    builder: (context, user, child) {
                      return badges.Badge(
                        badgeContent: Text(
                          user.totalProduct.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .overline!
                              .copyWith(color: Colors.white),
                        ),
                        position: badges.BadgePosition.topEnd(top: 0, end: 3),
                        badgeAnimation: badges.BadgeAnimation.slide(
                          curve: Curves.easeInCubic,
                        ),
                        showBadge: true,
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.amber,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          iconSize: 27,
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                ])),
        drawer: DrawerWidget(),
        // body:ImageContainer()
        body: [
          HomePage(),
          OrderListScreen(),
          // OrdersScreen(),
          VendorListScreen(),
          FiltersBottomSheet(),
          More()
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          labelBehavior: labelBehavior,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              print(currentPageIndex);
              print(index);
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.shopping_cart_checkout_rounded),
              label: 'Orders',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.people),
              icon: Icon(Icons.people),
              label: 'Vendors',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.help_center),
              icon: Icon(Icons.help_center_rounded),
              label: 'Help',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.more_horiz),
              icon: Icon(Icons.more_horiz_rounded),
              label: 'More',
            ),
          ],
        ));
  }
}
