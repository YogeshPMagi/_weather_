import 'package:flutter/material.dart';
class AdditionalInfoItem extends StatelessWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4137618857.
  final IconData icon ;
  final String label; 
  final String value;
 const AdditionalInfoItem({super.key,
 required this.icon,
 required this.value,
 required this.label
 });


  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[ 
        Icon(
          icon,
        size:32),
          SizedBox(height:8),
         Text(label),
        
          SizedBox(height:6),
        Text(value,
        style:
        TextStyle(
          fontSize:16,
          fontWeight: FontWeight.bold,
        ) ,),
        
      ]
    );
  }
}