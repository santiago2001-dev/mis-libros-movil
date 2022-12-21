 import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailStorePage extends StatefulWidget {
var store;
DetailStorePage(this.store);

   @override
   State<DetailStorePage> createState() => _DetailStorePageState(store);
 }

 class _DetailStorePageState extends State<DetailStorePage> {
  var store;
  _DetailStorePageState(this.store);

   final Completer<GoogleMapController> _controller =
   Completer<GoogleMapController>();

   final Set<Marker> _markets = Set<Marker>();



   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text(store['name']),),
       body: GoogleMap(
         mapType: MapType.terrain,
         initialCameraPosition: CameraPosition(
           target: LatLng(store['latitude'],store['longitude']),
           zoom: 15,
         ),
         markers: _markets ,
         onMapCreated: (GoogleMapController controller) {
           _controller.complete(controller);
           _showMarket();
         },
       ),


     );
   }

   void _showMarket (){
  setState(() {
    _markets.add(Marker(
      markerId: MarkerId(store['name']),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(store['latitude'],store['longitude']),
      infoWindow: InfoWindow(
        title: store['name'],
        snippet: "telefono: ${store['phone']}",

      )

    ));
  });
   }
 }


