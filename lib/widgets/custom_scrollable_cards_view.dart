import 'package:flutter/material.dart';

class CustomScrollableCardsView extends StatefulWidget {
  final List<Widget> children;
  final double height;
  final EdgeInsetsGeometry padding;

  const CustomScrollableCardsView({
    super.key,
    required this.children,
    this.height = 300,
    this.padding = const EdgeInsets.only(right: 20),
  });

  @override
  State<CustomScrollableCardsView> createState() =>
      _CustomScrollableCardsViewState();
}

class _CustomScrollableCardsViewState extends State<CustomScrollableCardsView> {
  late ScrollController _scrollController;
  bool _showLeftArrow = false;
  bool _showRightArrow = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateScrollState);
    // Delay to ensure build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollState();
    });
  }

  void _updateScrollState() {
    setState(() {
      _showLeftArrow = _scrollController.offset > 0;
      _showRightArrow =
          _scrollController.offset < _scrollController.position.maxScrollExtent;
    });
  }

  void _scroll(double offset) {
    _scrollController.animateTo(
      _scrollController.offset + offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Scrollable Cards Section
        SizedBox(
          height: widget.height,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: widget.padding,
                child: widget.children[index],
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Scroll Controls Bar
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Arrow Button
              _buildScrollButton(
                Icons.arrow_back,
                _showLeftArrow,
                () => _scroll(-200),
              ),
              // Scrollbar
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    trackVisibility: true,
                    thumbVisibility: true,
                    child: Container(),
                  ),
                ),
              ),
              // Right Arrow Button
              _buildScrollButton(
                Icons.arrow_forward,
                _showRightArrow,
                () => _scroll(200),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScrollButton(
    IconData icon,
    bool isEnabled,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        color: isEnabled
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(8),
          child: Icon(
            icon,
            color: isEnabled ? Colors.white : Colors.grey.shade500,
            size: 18,
          ),
        ),
      ),
    );
  }
}
