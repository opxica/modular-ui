<img src="https://github.com/opxica/modular-ui/assets/67179751/c4f1045b-0d7a-4228-b663-3e1f8238d59c" alt="ModularUI : Pre-built beautiful flutter widgets Inspired by material-tailwind and shadcn/ui" />
</p>

<div align="center">

[![Modular UI Badge](https://img.shields.io/badge/website-000000?style=for-the-badge&logo=About.me&logoColor=white)](https://modularui.site)
[![Github Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/opxica)
[![Twitter Badge](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/modularui)
[![Discord Badge](https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white)](https://discord.com/invite/jEPKuWYt)

</div>

<p align="center">
Craft beautiful, accessible, and responsive Flutter UIs with a Modular-UI Design-inspired component library
</p>

<hr>

## How to use

#### Installation

Run this command in your terminal

```terminal
flutter pub add modular_ui
```

#### Import

Add this line to import the package.

```dart
import 'package:modular_ui/modular_ui.dart';
```

<hr>

## Modular UI Widgets:

## Primary Cards

<table>
  <tr>  
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/c6e15160-6165-49bd-8016-dcce974eb26a" alt="Image 2"></td>
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/52810d6a-6d07-41dc-a8ab-e5f7e95859b1" alt="Image 3"></td>
     <td><img src="https://github.com/opxica/modular-ui/assets/67179751/28564d8c-a360-4d58-9c19-62c83b507673" alt="Image 5"></td>
       <td><img src="https://github.com/opxica/modular-ui/assets/67179751/dda487f6-c790-47bd-8eba-9fc5c517c3f9" alt="Image 1"></td>
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/afe28cac-31f9-4abd-b3c8-9e548291ac14" alt="Image 4"></td>
    
  </tr>
</table>

## Carousels

<table>
  <tr>
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/9161bf90-44af-4fc3-aa15-7a01abb59b24" alt="Gif 1"></td>
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/fc8813f1-5b41-417e-a9d4-ff92e286b385" alt="Gif 2"></td>
        <td><img src="https://github.com/opxica/modular-ui/assets/67179751/b1ee6be2-48a0-4384-8993-26b48942a329" alt="Gif 5"></td>
  
  </tr>
</table>

<table>
  <tr>
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/86087933-8470-43c3-9545-009487d48233" alt="Gif 4"></td>
      <td><img src="https://github.com/opxica/modular-ui/assets/67179751/7b60737f-b598-466e-b6b9-9f5b25171b36" alt="Gif 6"></td>
       <td><img src="https://github.com/opxica/modular-ui/assets/67179751/c7a7d5a3-5522-4d15-ab7c-09903d9715eb" alt="Gif 3"></td>
   
  </tr>
</table>

## Buttons

<table>
  <tr>  
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/c5ea0cd0-5d7c-423e-a85a-77a76e7f3ffe", height="300", alt="Image 2"></td>
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/42f199a6-06a2-4ea8-9042-491db28a11a7", height="300", alt="Image 3"></td>
   </tr>
</table>

## Tab Bar

<table>
  <tr>  
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/18ed3c7a-44e5-4eb5-8c8a-403185976976" alt="Image 2", height="300"></td>
  </tr>
</table>

## Dialog Box

<table>
  <tr>  
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/6537953f-6009-439f-be29-47ba4a6a839c" alt="Image 2", height="300"></td>
  </tr>
</table>

## Sliders

<table>
  <tr>  
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/fe250daf-c3e4-4d7c-ad76-22887ecd3601" alt="Image 2", height="300"></td>
  </tr>
</table>

## Switch

<table>
  <tr>  
    <td><img src="https://github.com/opxica/modular-ui/assets/67179751/f2b9faa5-e88a-4ba7-95e7-2a611097ccbb" alt="Image 2",  height="300"></td>
  </tr>
</table>
<hr>

## Our Widget Catalog

<strong>Avatar</strong>

<strong>Breadcrumbs</strong>

<strong>Button</strong>

- Primary Button
- Secondary Button
- Gradient Button
- Loading Button
- Outlined Button
- Text Button
- Block Level Buttons

<strong>Card</strong>

- Simple Card
- Primary Card
- Profile Card
- Sign in Card
- Sign up Card
- Pricing Card
- Blog Card

<strong>Checkbox</strong>

<strong>Carousel</strong>

<strong>Dialog</strong>

<strong>Footer</strong>

<strong>Input Fields</strong>

<strong>List Tile</strong>

<strong>Radio Button</strong>

<strong>Rating Bar</strong>

<strong>Slider</strong>

<strong>Tab View</strong>

<strong>Switch</strong>

<hr>

## Code Samples

#### Buttons

Primary Button

```dart
 MUIPrimaryButton(
      text: "Primary Button",
      onPressed: () => onButtonPressed("Primary Button"),
    ),
```

####  Cards

Primary Card

```dart
  MUIPrimaryCard(
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
```

####  Carousal

Primary Carousal 

```dart
  MUICarousel(
            images: [
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png"
            ],
            indicatorType: CarouselIndicatorType.dot,
            duration: Duration(seconds: 2),
          ),
```

For more code smaples, you can head on to your documentaion.

<hr>

## Features

- **Comprehensive Modular-UI Design components:** Build modern and feature-rich interfaces with a wide range of buttons, cards, forms, navigation elements, and more.
- **Highly customizable:** Tailor components to your exact needs with extensive styling options.
- **Responsive design:** Ensure optimal UI experiences across different screen sizes.
- **Accessibility focus:** Built with accessibility in mind, adhering to best practices.
- **Lightweight and performant:** Efficiently crafted for smooth user interactions.

## Additional Features

- **Custom themes and color palettes:** Define your own visual style for a cohesive look.
- **Dark mode support:** Seamlessly adapt your UI to user preferences.

<hr>

## Contributing

Calling on all the trendsetting Flutter enthusiasts! ❤️‍🔥 Join forces as we pioneer the creation of the ultimate, expansive, and seamless UI Library for Flutter. Let's make waves together! 🚀
Please refer to our contribution guidelines for details and don't forget to drop a Hi at [discord](https://discord.gg/t9Vweu68)

<hr>
