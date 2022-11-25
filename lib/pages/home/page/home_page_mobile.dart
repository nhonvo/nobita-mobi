import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/home/store/home_store.dart';
import 'package:nobita/widgets/others/profile_card.dart';

class HomePageMobile extends StatelessWidget {
  final HomeStore store;
  const HomePageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileCard(
              name: 'Nguyen Duc Hoa',
              email: 'a@example.com',
              accountNumber: '124121232139',
              balance: '213439284',
            )
          ],
        ),
      ),
    );
  }
}
