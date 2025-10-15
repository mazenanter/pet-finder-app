import 'package:flutter/material.dart';

import '../../../../../core/themes/colors_manager.dart';

class SequentialLoading extends StatefulWidget {
  const SequentialLoading({super.key});

  @override
  State<SequentialLoading> createState() => _SequentialLoadingState();
}

class _SequentialLoadingState extends State<SequentialLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _scales;
  late List<Animation<double>> _opacities;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _scales = List.generate(3, (index) {
      final start = index * 0.2;
      final end = start + 0.4;

      return Tween<double>(begin: 0.5, end: 1.2).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });

    _opacities = List.generate(3, (index) {
      final start = index * 0.2;
      final end = start + 0.4;

      return Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _opacities[index].value,
                child: Transform.scale(
                  scale: _scales[index].value,
                  child: child,
                ),
              );
            },
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: ColorsManager.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
      ),
    );
  }
}
