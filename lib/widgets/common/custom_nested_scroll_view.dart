import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/common/app_bar_title.dart';

class CustomNestedScrollView extends StatelessWidget {
  final Widget widget;
  final String appbarName;
  final String headerImage;
  final Widget infoWidget;

  CustomNestedScrollView({
    super.key,
    required this.widget,
    required this.appbarName,
    required this.headerImage,
    required this.infoWidget,
  });

  final _controller = ScrollController();

  bool _scrollNotificationHandler(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollEndNotification &&
        scrollNotification.depth == 0) {
      final minExtent = scrollNotification.metrics.minScrollExtent / 2.2;
      final maxExtent = scrollNotification.metrics.maxScrollExtent / 2.2;
      final middle = (maxExtent - minExtent) / 2;
      final pos = scrollNotification.metrics.pixels;

      double? scrollTo;

      if (minExtent < pos && pos <= middle) {
        scrollTo = minExtent;
      } else if (middle < pos && pos < maxExtent) {
        scrollTo = maxExtent;
      }

      if (scrollTo != null) {
        Timer(
          const Duration(milliseconds: 1),
          () => _controller.animateTo(scrollTo!,
              duration: const Duration(milliseconds: 300), curve: Curves.ease),
        );
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _scrollNotificationHandler,
      child: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverLayoutBuilder(
              builder: (context, constraints) {
                final scrolled = constraints.scrollOffset >
                    MediaQuery.of(context).size.height / 4.5;
                return SliverAppBar(
                  iconTheme: IconThemeData(
                    color: scrolled ? Colors.black : Colors.white,
                  ),
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height / 3.5,
                  title: scrolled ? Text(appbarName) : const SizedBox.shrink(),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness:
                        scrolled ? Brightness.dark : Brightness.light,
                    statusBarColor:
                        scrolled ? Colors.white : Colors.black.withOpacity(0.4),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(headerImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: AppBarTitle(title: appbarName),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: infoWidget,
              ),
            ),
          ];
        },
        body: widget,
      ),
    );
  }
}

 // SliverPersistentHeader(
        //   pinned: true,
        //   delegate: CustomSliverDelegate(
        //     headerImage: headerImage,
        //     sliverCard: sliverCard,
        //     appbarName: appbarName,
        //     expandedHeight: MediaQuery.of(context).size.height / 4.5,
        //   ),
        // ),
