import 'package:example/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget card() {
  return ListView(
    children: [
      const SizedBox(height: 16),

      /// Primary Card
      text("Primary Card"),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MUIPrimaryCard(
          title: 'UI/UX Review Check',
          description:
              'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona',
          image: Image.network(
            'https://images.unsplash.com/photo-1540553016722-983e48a2cd10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80',
            fit: BoxFit.cover,
          ),
          buttons: [
            MUIPrimaryButton(
              text: 'Read More',
              onPressed: () {},
            ),
          ],
        ),
      ),

      const SizedBox(height: 16.0),

      /// Profile Card
      text("Profile Card"),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MUIProfileCard(
            image: Image.network(
              'https://images.unsplash.com/photo-1661174731983-904796ac76c0?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
            name: 'Utkarsh Shrivastava',
            designation: 'Flutter Developer'),
      ),

      const SizedBox(height: 16.0),

      /// Simple Card
      text("Simple Card"),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MUISimpleCard(
          title: 'UI/UX Review Check',
          description:
              'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona',
          buttons: [
            MUIPrimaryButton(
              text: 'Read More',
              onPressed: () {},
            ),
          ],
        ),
      ),

      const SizedBox(height: 16.0),

      /// Blog Card
      text("Blog Card"),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MUIBlogCard(
          date: 'January 10',
          circularAvatarImages: const [
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1061&q=80',
            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
          ],
          title: 'UI/UX Review Check',
          onBlogCardPressed: () {},
          description:
              "Because it's about motivating the doers. Because I'm here to follow my dreams and inspire others.",
          image: Image.network(
            'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
            fit: BoxFit.cover,
          ),
        ),
      ),

      const SizedBox(height: 16.0),

      /// Pricing Card
      text("Pricing Card"),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MUIPricingCard(
          title: "Standard",
          button: MUILoadingBlockButton(
              bgColor: Colors.white,
              textColor: Colors.black,
              loadingStateText: 'Purchasing',
              loadingStateTextColor: Colors.black,
              text: 'Buy Now',
              onPressed: () async {
                await Future.delayed(const Duration(milliseconds: 500));
              }),
          duration: MUIPricingDuration.monthly,
          currency: MUIPricingCurrency.dollar,
          bgColor: const Color(0xFF37373C),
          amount: 29,
          items: const [
            MUIPricingCardItems(
                icon: Icon(
                  Icons.check_box_rounded,
                  color: Colors.white,
                ),
                title: " 5 team members"),
            MUIPricingCardItems(
                icon: Icon(
                  Icons.check_box_rounded,
                  color: Colors.white,
                ),
                title: "200+ components"),
            MUIPricingCardItems(
                icon: Icon(
                  Icons.check_box_rounded,
                  color: Colors.white,
                ),
                title: "40+ built-in pages"),
            MUIPricingCardItems(
                icon: Icon(
                  Icons.check_box_rounded,
                  color: Colors.white,
                ),
                title: "1 year free updates"),
            MUIPricingCardItems(
                icon: Icon(
                  Icons.check_box_rounded,
                  color: Colors.white,
                ),
                title: "Life time technical support"),
          ],
        ),
      ),

      const SizedBox(height: 16.0),

      /// Sign in card
      text("Sign in card"),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MUISignInCard(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          onRegisterNow: () {},
          onSignInPressed: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
        ),
      ),

      const SizedBox(height: 16.0),

      /// Sign up card
      text("Sign up card"),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MUISignUpCard(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          confirmPasswordController: TextEditingController(),
          onSignUpPressed: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          onLogInNowPressed: () {},
        ),
      ),

      const SizedBox(height: 16.0),
    ],
  );
}
