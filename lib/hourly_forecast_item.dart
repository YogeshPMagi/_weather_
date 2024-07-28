import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temperature;
  const HourlyForecastItem ({super.key,
   required this.icon,
  required this.time,
  required this.temperature});
 






  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 6,
          
          child:
           
          Container( 
            width: 100,
            
            padding:  const EdgeInsets.all(8.0),
   // Suggested code may be subject to a license. Learn more: ~LicenseLog:238184876.
   // Suggested code may be subject to a license. Learn more: ~LicenseLog:1378749209.
   // Suggested code may be subject to a license. Learn more: ~LicenseLog:1913958492.
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),),
            child:  Column(
              children: [
                Text( time ,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),


               const SizedBox(height: 6),
                Icon( icon,
                size:32 ),
               
                const SizedBox(height: 8),
                Text(temperature,
                style: TextStyle(
                  
                  
                ),
            
                )
            
              ],
            ),
          ),
        );
  }
}