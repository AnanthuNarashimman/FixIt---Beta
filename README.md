FIX-it: A Service Hiring Flutter Application

---------------------------------------------
📱 Overview:
---------------------------------------------
Fix-it is a role-based Flutter mobile application that connects Clients and Workers for various on-demand services. The app allows users to register as either a Client (service seeker) or a Worker (service provider), providing dedicated homepages and features for each role.

Clients can explore categories, browse through worker profiles, request services, track bookings, and communicate via chat. Workers can manage job requests, update their profiles, and maintain availability status.

---------------------------------------------
👤 User Features:
---------------------------------------------

1. 🔐 Role-Based Authentication:
   - Users choose between 'Client' and 'Worker' during sign-up.
   - Each role is redirected to a customized homepage.

2. 🏠 User Home Page:
   - Welcome AppBar with drawer menu for navigation.
   - A stylish Search Bar to look for workers.
   - Horizontally scrollable list of Categories (e.g., Plumber, DJ, Tailor).
   - Featured Workers shown in card format with fees displayed.
   - Bottom Navigation Bar with 'Home' and 'Chat' options.
   - Clicking a Worker Card opens a detailed Worker Profile.

3. 👤 Worker Profile Page:
   - Includes worker’s name, address, contact info, bio, average rating, and service fee.
   - Contains a 'Hire Now' button which, once tapped, changes color and text to 'Requested'.

4. 💼 My Bookings Page:
   - Displays list of all bookings made by the user.
   - Shows status of each booking (e.g., Requested, Accepted).
   - If a booking is "Accepted", it displays a visual indicator and makes the card clickable for further action (like payment).

5. 📂 Categories Page:
   - A separate page showcasing all available professions listed in stylized cards for easy browsing.

---------------------------------------------
🔧 Worker Side Features:
---------------------------------------------

1. 🏠 Worker Home Page:
   - Displays notifications, live chat access, availability status toggle.
   - Profile section to update personal details and skill information.

2. 📋 Worker Dashboard:
   - Access via the drawer.
   - Allows updating of name, city, contact details, bio, and average rating.

3. 🛠 My Jobs Page (for Workers):
   - Shows job requests with an option to Accept or Decline.
   - Detailed job view with full client info and booking data.

---------------------------------------------
💬 Chat Functionality:
---------------------------------------------
- A live chat system UI has been built between users and workers.
- Designed from both sender and receiver points of view.

---------------------------------------------
📦 Tech Stack:
---------------------------------------------
- **Flutter** for frontend development  
- **Firebase Auth** for authentication and user role management  
- **Google Fonts** for custom styling  
- **Provider / Stateful Widgets** for basic state management

---------------------------------------------
📹 Demo Videos:
---------------------------------------------
- Check the Video demo [here](https://drive.google.com/drive/folders/13aa7CKVZ0TGghYHN_4_ewUMatCXsGylU?usp=drive_link)

----------------------------------------------
  Current Status:
  - The app is currently very much static.
  - The app can be logged in and logged out and is hosted in firebase.
  - The user can create a client account or a worker account all through their own.
  - Testing: Client: abc@gmail.com | pw: 12345678
             Worker: def@gmail.com | pw: 12345678
  - apk attached


  ToDo:
  - We plan on making the app dynamic and support changes and display it.
  - Payment gateway is under tha plan.
  - Worker tracking functionality.
