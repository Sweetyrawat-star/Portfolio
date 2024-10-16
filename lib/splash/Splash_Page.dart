import 'package:concentric_transition/clipper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';



class ConcentricPageViewScreen extends StatefulWidget {
  final Function(int index) itemBuilder;
  final Function(int page)? onChange;
  final Function? onFinish;
  final int? itemCount;
  final PageController? pageController;
  final bool pageSnapping;
  final bool reverse;
  final List<Color> colors;
  final ValueNotifier? notifier;
  final double scaleFactor;
  final double opacityFactor;
  final double radius;
  final double verticalPosition;
  final Axis direction;
  final ScrollPhysics? physics;
  final Duration duration;
  final Curve curve;
  final Key? pageViewKey;
  final List<String> text;

  /// Useful for adding a next icon to the page view button
  final WidgetBuilder? nextButtonBuilder;

  const ConcentricPageViewScreen({
    Key? key,
    required this.itemBuilder,
    required this.colors,
    this.pageViewKey,
    this.onChange,
    this.onFinish,
    this.itemCount,
    this.pageController,
    this.pageSnapping = true,
    this.reverse = false,
    this.notifier,
    this.scaleFactor = 0.3,
    this.opacityFactor = 0.0,
    this.radius = 40.0,
    this.verticalPosition = 0.75,
    this.direction = Axis.horizontal,
    this.physics = const ClampingScrollPhysics(),
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeInOutSine, // const Cubic(0.7, 0.5, 0.5, 0.1),
    this.nextButtonBuilder, required this.text,
  })  : assert(colors.length >= 2),
        super(key: key);

  @override
  _ConcentricPageViewScreenState createState() => _ConcentricPageViewScreenState();
}

class _ConcentricPageViewScreenState extends State<ConcentricPageViewScreen> {
  late PageController _pageController;
  double _progress = 0;
  int _prevPage = 0;
  Color? _prevColor;
  Color? _nextColor;

  @override
  void initState() {
    _prevColor = widget.colors[_prevPage];
    _nextColor = widget.colors[_prevPage + 1];
    _pageController = (widget.pageController ?? PageController(initialPage: 0))
      ..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        _buildClipper(),
        _buildPageView(),
        Positioned(
          top: MediaQuery.of(context).size.height * widget.verticalPosition,
          child: _Button(
            pageController: _pageController,
            widget: widget,
          ),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      key: widget.pageViewKey,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        overscroll: false,
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      clipBehavior: Clip.none,
      scrollDirection: widget.direction,
      controller: _pageController,
      reverse: widget.reverse,
      physics: widget.physics,
      itemCount: widget.itemCount,
      pageSnapping: widget.pageSnapping,
      onPageChanged: (int page) {
        if (widget.onChange != null) {
          widget.onChange!(page);
        }
      },
      itemBuilder: (context, index) {
        final child = widget.itemBuilder(index);
        if (!_pageController.position.hasContentDimensions) {
          return child;
        }
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            final progress = _pageController.page! - index;
            if (widget.opacityFactor != 0) {
              child = Opacity(
                opacity: (1 - (progress.abs() * widget.opacityFactor))
                    .clamp(0.0, 1.0),
                child: child,
              );
            }
            if (widget.scaleFactor != 0) {
              child = Transform.scale(
                scale:
                (1 - (progress.abs() * widget.scaleFactor)).clamp(0.0, 1.0),
                child: child,
              );
            }
            return child!;
          },
          child: child,
        );
      },
    );
  }

  Widget _buildClipper() {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (ctx, _) {
        return ColoredBox(
          color: _prevColor!,
          child: ClipPath(
            clipper: ConcentricClipper(
              progress: _progress,
              reverse: widget.reverse,
              radius: widget.radius,
              verticalPosition: widget.verticalPosition,
            ),
            child: ColoredBox(
              color: _nextColor!,
              child: const SizedBox.expand(),
            ),
          ),
        );
      },
    );
  }

  void _onScroll() {
    final direction = _pageController.position.userScrollDirection;
    double page = _pageController.page ?? 0;

    if (direction == ScrollDirection.forward) {
      _prevPage = page.toInt();
      _progress = page - _prevPage;
    } else {
      _prevPage = page.toInt();
      _progress = page - _prevPage;
    }

    final total = widget.colors.length;
    final prevIndex = _prevPage % total;
    int nextIndex = prevIndex + 1;

    if (prevIndex == total - 1) {
      nextIndex = 0;
    }

    _prevColor = widget.colors[prevIndex];
    _nextColor = widget.colors[nextIndex];

    widget.notifier?.value = page - _prevPage;
  }
}
class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.pageController,
    required this.widget,
  }) : super(key: key);

  final PageController pageController;
  final ConcentricPageViewScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0,bottom: 20),
      child: GestureDetector(
        onTap: () {
          final isFinal = pageController.page == widget.colors.length - 1;
          if (isFinal && widget.onFinish != null) {
            widget.onFinish!();
            return;
          }
          pageController.nextPage(
            duration: widget.duration,
            curve: widget.curve,
          );
        },
        child: Container(
          decoration: BoxDecoration(
           // color: widget.colors[pageController.page?.round() ?? 0],
          ),
          child: AnimatedBuilder(
            animation: pageController,
            builder: (context, _) {
              final currentPage = pageController.page?.round() ?? 0;
              final text = widget.text[currentPage % widget.text.length]; // Get the current text for the page
              return Text(
                text,
                style: TextStyle(
                  fontSize: 18,  // Adjust the font size
                  color: Colors.white, // Set the text color
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



