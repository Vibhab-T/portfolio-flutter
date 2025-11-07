import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomCarouselView extends StatefulWidget {
  final List<Widget> children;
  final double height;
  final int cardsToShow;

  const CustomCarouselView({
    super.key,
    required this.children,
    this.height = 310,
    this.cardsToShow = 1,
  });

  @override
  State<CustomCarouselView> createState() => _CustomCarouselViewState();
}

class _CustomCarouselViewState extends State<CustomCarouselView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          // Check if carousel can scroll horizontally
          if (_scrollController.position.maxScrollExtent > 0) {
            // Horizontal scroll via mouse wheel
            _scrollController.jumpTo(
              (_scrollController.offset + pointerSignal.scrollDelta.dy).clamp(
                0.0,
                _scrollController.position.maxScrollExtent,
              ),
            );
            // Prevent parent from scrolling
            GestureBinding.instance.pointerSignalResolver.register(
              pointerSignal,
              (e) {},
            );
          }
        }
      },
      child: SizedBox(
        height: widget.height,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.children.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: widget.children[index],
            );
          },
        ),
      ),
    );
  }
}
