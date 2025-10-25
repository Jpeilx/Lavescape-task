import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/lavescape_card_view.dart';
import 'package:lavescape/features/search_result/views/widgets/price_marker_widget.dart';

class SearchResultMapWidget extends StatefulWidget {
  final List<LavescapeModel> lavescapeData;

  const SearchResultMapWidget({super.key, this.lavescapeData = const []});

  @override
  State<SearchResultMapWidget> createState() => _SearchResultMapWidgetState();
}

class _SearchResultMapWidgetState extends State<SearchResultMapWidget> {
  MapboxMap? mapboxMap;
  PointAnnotationManager? pointAnnotationManager;
  int? selectedMarkerIndex;
  List<PointAnnotation> annotations = [];
  LavescapeModel? selectedLavescapeData;
  Cancelable? _tapCancelable;

  

  void _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    _setupAnnotations();
  }

  Future<void> _setupAnnotations() async {
    if (mapboxMap == null || widget.lavescapeData.isEmpty) return;

    // Create annotation manager
    pointAnnotationManager = await mapboxMap!.annotations
        .createPointAnnotationManager();

    _tapCancelable = pointAnnotationManager!.tapEvents(
      onTap: (annotation) {
        final index = annotations.indexOf(annotation);
        if (index != -1) {
          final data = widget.lavescapeData[index];
          _showLavescapeCard(data, index);
        }
      },
    );
    await _addMarkers();
  }

  Future<void> _addMarkers() async {
    if (pointAnnotationManager == null) return;

    for (int i = 0; i < widget.lavescapeData.length; i++) {
      final data = widget.lavescapeData[i];

      // Convert marker widget to image
      final imageData = await _widgetToImage(
        PriceMarkerWidget(price: data.price, isSelected: false),
      );

      // Create annotation options
      final options = PointAnnotationOptions(
        geometry: Point(coordinates: Position(data.longitude, data.latitude)),
        image: imageData,
        iconSize: 1.0,
      );

      // Create and store the annotation
      final annotation = await pointAnnotationManager!.create(options);
      annotations.add(annotation);
    }
  }

  void _showLavescapeCard(LavescapeModel data, int index) {
    setState(() {
      selectedMarkerIndex = index;
      selectedLavescapeData = data;
    });
  }

  Future<Uint8List> _widgetToImage(Widget widget) async {
    final repaintBoundary = RenderRepaintBoundary();
    final view = ui.PlatformDispatcher.instance.views.first;
    final logicalSize = view.physicalSize / view.devicePixelRatio;

    final renderView = RenderView(
      view: view,
      child: RenderPositionedBox(
        alignment: Alignment.center,
        child: repaintBoundary,
      ),
      configuration: ViewConfiguration(
        logicalConstraints: BoxConstraints.tight(logicalSize),
        devicePixelRatio: view.devicePixelRatio,
      ),
    );

    final pipelineOwner = PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: MediaQueryData.fromView(view),
          child: Material(type: MaterialType.transparency, child: widget),
        ),
      ),
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final image = await repaintBoundary.toImage(
      pixelRatio: view.devicePixelRatio,
    );
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  @override
  void dispose() {
    _tapCancelable?.cancel();
    pointAnnotationManager?.deleteAll();
    annotations.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(
          key: const ValueKey("mapWidget"),
          cameraOptions: CameraOptions(
            center: Point(
              coordinates: Position(
                widget.lavescapeData.isNotEmpty
                    ? widget.lavescapeData.first.longitude
                    : 46.738586,
                widget.lavescapeData.isNotEmpty
                    ? widget.lavescapeData.first.latitude
                    : 24.774265,
              ),
            ),
            zoom: 12.0,
          ),
          styleUri: MapboxStyles.STANDARD,
          onMapCreated: _onMapCreated,
        ),
         if (selectedLavescapeData != null)
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                selectedLavescapeData = null;
                selectedMarkerIndex = null;
              });
            },
            child: Container(
              color: Colors.transparent, // makes it tappable but invisible
            ),
          ),
        ),
        if (selectedLavescapeData != null)
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 80,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                final curved = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutBack,
                );
                return FadeTransition(
                  opacity: curved,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.3), // slides up slightly
                      end: Offset.zero,
                    ).animate(curved),
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.95,
                        end: 1.0,
                      ).animate(curved),
                      child: child,
                    ),
                  ),
                );
              },
              child: LavescapeCardView(
                key: ValueKey(
                  selectedLavescapeData?.price,
                ), // make sure it animates properly
                lavescapeData: selectedLavescapeData,
              ),
            ),
          ),
      ],
    );
  }
}
