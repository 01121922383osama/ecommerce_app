import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../pages/product_details_page.dart';

class BuildGridContainerWidget extends StatelessWidget {
  final List<ProductModel> products;

  const BuildGridContainerWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          pattern: [
            const WovenGridTile(1),
            const WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = products[index];
            final heroTag = 'product_${product.name}';

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ProductDetailsPage(
                      product: product,
                      heroTag: heroTag,
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOutCubic;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 500),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.primaries[index % Colors.primaries.length]
                        .withOpacity(0.3),
                  ),
                  color: Colors.grey.shade100,
                ),
                child: Stack(
                  children: [
                    Hero(
                      tag: heroTag,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(product.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Hero(
                        tag: '${heroTag}_price',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Hero(
                        tag: '${heroTag}_name',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              product.name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
