import 'package:ecommerce/utilities/images_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../widgets/product_list_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildHeaderList(
    BuildContext context, {
    required String title,
    required String description,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //============= Image Banner ========================================
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppImage.imageBannerHomePage,
                width: double.infinity,
                height: size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.4,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Text(
                  'Esey Shop',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          //=======================================================================
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16,
            ),
            child: Column(
              children: [
//======== List 1 ==============================================================                
                _buildHeaderList(
                  context,
                  title: 'Shop',
                  description: 'He this is offer',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: productsItem
                          .map((e) => ProductListItems(product: e))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
//============= List 2 =========================================================                
                _buildHeaderList(
                  context,
                  title: 'For You',
                  description: 'Hot Offer In New Product',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: productsItem
                          .map((e) => ProductListItems(product: e))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          //========= List Product 1 =====================================================
        ],
      ),
    );
  }
}
