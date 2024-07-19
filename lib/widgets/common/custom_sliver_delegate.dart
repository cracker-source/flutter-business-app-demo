import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final String appbarName;
  final Widget sliverCard;
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final String headerImage;

  CustomSliverDelegate({
    required this.expandedHeight,
    required this.headerImage,
    required this.appbarName,
    required this.sliverCard,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight
                ? kToolbarHeight + 40
                : appBarSize + 40,
            child: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black.withOpacity(0.2),
                  statusBarIconBrightness: Brightness.light),
              // backgroundColor:
              // cardTopPosition <= 0 ? Colors.white : AppColors.primaryColor,
              elevation: 0.0,
              title: Opacity(
                opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                child: Text(
                  appbarName,
                ),
              ),
            ),
          ),
          cardTopPosition <= 0
              ? const SizedBox.shrink()
              : SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Opacity(
                    opacity: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(headerImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8 * percent),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: sliverCard,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
