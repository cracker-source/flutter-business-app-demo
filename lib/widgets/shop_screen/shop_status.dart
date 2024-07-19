import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social/widgets/shop_screen/icon_row_title.dart';

class ShopStatus extends StatefulWidget {
  const ShopStatus({super.key});

  @override
  State<ShopStatus> createState() => _ShopStatusState();
}

class _ShopStatusState extends State<ShopStatus> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.grey.shade100,
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconRowTitle(
                    text: "Shop status",
                    icon: Icons.business_outlined,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      "Customers will be able to see the availability of your business",
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
              Transform.rotate(
                angle: 195,
                child: SvgPicture.asset(
                  "assets/business_open.svg",
                  height: 50,
                  width: 50,
                  colorFilter: const ColorFilter.mode(
                    Colors.green,
                    BlendMode.srcIn,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
