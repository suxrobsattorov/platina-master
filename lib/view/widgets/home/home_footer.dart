import 'package:flutter/material.dart';
import 'package:platina/view/constants/colors.dart';
import 'package:platina/view/constants/icons.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AssetsIcons.platinaTitle,
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sayt haqida',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Reklama',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Mahfiylik siyosati',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            "© 2023 Platina.uz. Barcha huquqlar himoyalangan. «Platina.uz» saytida joylangan ma'lumotlar muallifning shaxsiy fikri. Saytda joylangan har qanday materiallardan yozma ruhsatsiz foydalanish taqiqlanadi.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            "O‘zbekiston Respublikasi Prezidenti Administratsiyasi huzuridagi Axborot va jamoatchilik bilan aloqalar agentligi 02.12.2022 sanasida № 051412 sonli guvohnoma bilan OAV sifatida ruyxatga olingan",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetsIcons.telegram,
                    height: 35,
                    width: 35,
                    color: Color(0xFF737C98),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    AssetsIcons.instagram,
                    height: 35,
                    width: 35,
                    color: Color(0xFF737C98),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    AssetsIcons.facebook,
                    height: 35,
                    width: 35,
                    color: Color(0xFF737C98),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    AssetsIcons.youtube,
                    height: 35,
                    width: 35,
                    color: Color(0xFF737C98),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    AssetsIcons.twitter,
                    height: 35,
                    width: 35,
                    color: Color(0xFF737C98),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    AssetsIcons.tiktok,
                    height: 35,
                    width: 35,
                    color: Color(0xFF737C98),
                  ),
                ],
              ),
              Container(
                height: 35,
                width: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '18+',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFED1C24),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'REDMEDIA',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "IT kompaniyasi tomonidan ishlab chiqildi",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
