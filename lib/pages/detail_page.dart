import 'package:coffee_shop_ui/models/coffee.dart';
import 'package:coffee_shop_ui/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.coffee});
  final Coffee coffee;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String sizeSelected = 'M';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    final screenHeight = mq.size.height;

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        children: [
          Gap(screenHeight * 0.08),
          buildHeader(screenWidth),
          Gap(screenHeight * 0.03),
          buildImage(screenHeight),
          Gap(screenHeight * 0.025),
          buildMainInfo(screenWidth),
          Gap(screenHeight * 0.025),
          buildDescription(),
          Gap(screenHeight * 0.04),
          buildSize(screenWidth),
          Gap(screenHeight * 0.03),
        ],
      ),
      bottomNavigationBar: buildPrice(screenWidth),
    );
  }

  Widget buildHeader(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const ImageIcon(
            AssetImage('assets/ic_arrow_left.png'),
          ),
        ),
        const Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff242424),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage('assets/ic_heart_border.png'),
          ),
        ),
      ],
    );
  }

  Widget buildImage(double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        widget.coffee.image,
        width: double.infinity,
        height: screenHeight * 0.25, // responsive
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildMainInfo(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.coffee.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xff242424),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(4),
                Text(
                  widget.coffee.type,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffA2A2A2),
                  ),
                ),
                const Gap(16),
                Row(
                  children: [
                    Image.asset('assets/ic_star_filled.png', width: 20, height: 20),
                    const Gap(4),
                    Text(
                      '${widget.coffee.rate} ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff2A2A2A),
                      ),
                    ),
                    Text(
                      '(${widget.coffee.review})',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xffA2A2A2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: ['assets/bike.png', 'assets/bean.png', 'assets/milk.png'].map((e) {
                return Container(
                  margin: const EdgeInsets.only(left: 12),
                  width: screenWidth * 0.11,
                  height: screenWidth * 0.11,
                  decoration: BoxDecoration(
                    color: const Color(0xffEDEDED).withAlpha(90),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    e,
                    height: screenWidth * 0.06,
                    width: screenWidth * 0.06,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const Gap(16),
        const Divider(
          indent: 16,
          endIndent: 16,
          color: Color(0xffE3E3E3),
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff242424),
          ),
        ),
        const Gap(8),
        ReadMoreText(
          widget.coffee.description,
          trimLength: 110,
          trimMode: TrimMode.Length,
          trimCollapsedText: ' Read More',
          trimExpandedText: ' Read Less',
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xffA2A2A2),
          ),
          moreStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xffC67C4E),
          ),
          lessStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xffC67C4E),
          ),
        ),
      ],
    );
  }

  Widget buildSize(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff242424),
          ),
        ),
        const Gap(16),
        Row(
          children: ['S', '', 'M', '', 'L'].map((e) {
            if (e == '') return const Gap(16);
            bool isSelected = sizeSelected == e;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    sizeSelected = e;
                  });
                },
                child: Container(
                  height: screenWidth * 0.11,
                  decoration: BoxDecoration(
                    color: Color(isSelected ? 0xffF9F2ED : 0xffFFFFFF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(isSelected ? 0xffC67C4E : 0xffE3E3E3),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(isSelected ? 0xffC67C4E : 0xff242424),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildPrice(double screenWidth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff909090),
                  ),
                ),
                const Gap(4),
                Text(
                  NumberFormat.currency(
                    decimalDigits: 2,
                    locale: 'en_US',
                    symbol: '\₹',
                  ).format(widget.coffee.price),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xffC67C4E),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth * 0.55, // responsive width
            child: ButtonPrimary(
              title: 'Buy Now',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
