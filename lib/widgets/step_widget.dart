import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      child: Center(
        child: ListTile(
          leading: Text(
            '1',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              color: Color(0XFFC2C2C2),
            ),
          ),
          title: Text(
            'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
            style: TextStyle(
              color: Color(0XFF797676),
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: false,
                side: BorderSide(
                  color: Color(0XFF797676),
                  width: 4.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onChanged: (isChecked) {},
              ),
              Text(
                '06:00',
                style: TextStyle(
                  color: Color(0XFF797676),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFFECECEC),
      ),
    );
  }
}
