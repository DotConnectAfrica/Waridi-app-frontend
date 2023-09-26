import 'package:flutter/material.dart';
import 'package:waridionline/screens/widgets/AllProductsGridView.dart';
import 'package:waridionline/screens/widgets/ProductsAppBar.dart';

import '../widgets/Homeappbar.dart';
import '../widgets/SideBar.dart';
import '../widgets/feeds/feed1.dart';

class FeedScreen extends StatelessWidget {
  final Widget? body; // Add this parameter
// {super.key, required this.texToDisplay, this.navigateTo, this.onpressed}
  const FeedScreen({Key? key, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: ProductsAppBar(),
        ),
        // drawer: DrawerWidget(),
        // body:ImageContainer()
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Feed1(),
              SizedBox(height: 20),
             Feed1()],
          ),
        ));
  }
}
