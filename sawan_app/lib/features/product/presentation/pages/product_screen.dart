import 'package:flutter/material.dart';
import 'package:sawan_app/features/home/presentation/widget/custom_grid_view.dart';
import 'package:sawan_app/features/product/presentation/widget/custom_search_bar.dart';
import 'package:sawan_app/features/product/presentation/widget/custom_tab_bar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(child: CustomSearchBar()),
          const CustomTapBar(),
          const Expanded(child: CustomGridView(loading: false)),
        ],
      ),
    );
  }
}
