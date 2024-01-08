import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget card() {
  return ListView(
    children: [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: MUIProfileCard(
          name: 'John Doe',
          designation: 'UI/UX Designer',
          url: 'https://docs.material-tailwind.com/img/team-3.jpg',
          socialIcons: [
            Icon(Icons.facebook),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: MUIPrimaryCard(
          title: 'UI/UX Review Check',
          onButtonTap: () {},
          description:
              'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona',
          image: Image.network(
              'https://images.unsplash.com/photo-1540553016722-983e48a2cd10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'),
          buttonText: 'Read more',
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: MUISimpleCard(
          title: 'UI/UX Review Check',
          onButtonTap: () {},
          description:
              'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona',
          buttonText: 'Read more',
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: MUIBlogCard(
          date: 'January 10',
          circularAvatarImages: const [
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1061&q=80',
            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
          ],
          title: 'UI/UX Review Check',
          onBlogCardTap: () {},
          description:
              "Because it's about motivating the doers. Because I'm here to follow my dreams and inspire others.",
          imagelink:
              'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
        ),
      ),
    ],
  );
}
