// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import "package:latlong2/latlong.dart" as latLng;
// import 'package:latlong2/latlong.dart';
// import 'package:social/utils/colors.dart';

// import '../utils/utils.dart';

// class VerificationMapScreen extends StatefulWidget {
//   const VerificationMapScreen({super.key});

//   @override
//   State<VerificationMapScreen> createState() => _VerificationMapScreenState();
// }

// class _VerificationMapScreenState extends State<VerificationMapScreen> {
//   double currentZoom = 13.0;
//   final MapController _mapController = MapController();
//   LatLng currentCenter = latLng.LatLng(14.7781056, 79.5925074);

//   void _zoom() {
//     currentZoom = currentZoom - 1;
//     _mapController.move(currentCenter, currentZoom);
//   }

//   void _zoomIncrease() {
//     currentZoom = currentZoom + 1;
//     _mapController.move(currentCenter, currentZoom);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Confirm business location"),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: _zoomIncrease,
//             child: Icon(Icons.add),
//           ),
//           SizedBox(height: 20),
//           FloatingActionButton(
//             heroTag: null,
//             onPressed: _zoom,
//             child: Icon(Icons.remove),
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: Consumer(builder: (context, ref, child) {
//           final userLocation = ref.read(userLocationProvider);
//           return userLocation.when(
//               data: (data) {
//                 print("${data.latitude!} ${data.longitude!}");
//                 return FlutterMap(
//                   mapController: _mapController,
//                   options: MapOptions(
//                     center: currentCenter,
//                     zoom: currentZoom,
//                     // maxZoom: 15,
//                   ),
//                   children: [
//                     TileLayer(
//                       urlTemplate:
//                           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                       userAgentPackageName: 'com.example.app',
//                     ),
//                     MarkerClusterLayerWidget(
//                       options: MarkerClusterLayerOptions(
//                         maxClusterRadius: 45,
//                         size: const Size(40, 40),
//                         anchor: AnchorPos.align(AnchorAlign.center),
//                         fitBoundsOptions: const FitBoundsOptions(
//                           padding: EdgeInsets.all(50),
//                           maxZoom: 17,
//                         ),
//                         markers: [
//                           Marker(
//                             point:
//                                 latLng.LatLng(data.latitude!, data.longitude!),
//                             width: 80,
//                             height: 80,
//                             builder: (context) => Icon(
//                               Icons.location_on,
//                               size: 30,
//                               color: AppColors.primaryColor,
//                             ),
//                           ),
//                         ],
//                         builder: (context, markers) {
//                           return Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.blue),
//                             child: Center(
//                               child: Text(
//                                 markers.length.toString(),
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 );
//               },
//               error: (error, stackTrace) => showSnackBar(error.toString()),
//               loading: () => const Center(child: CircularProgressIndicator()));
//         }),
//       ),
//     );
//   }
// }
