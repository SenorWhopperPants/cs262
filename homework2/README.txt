We checked with Vlinden and he okay-ed this for our homework.  Basically, we made a settings page.  In the settings page, 
you can change the username, select dark mode, and select a font size for the app.  When a change is made, it is saved to
the phone's stoarge (using ionic storage and SQLite).  We weren't able to get the dark mode or the font size settings to 
actually change the app's look yet, but we are going to implement that in our actual app for the project.  The buttons you
see at the bottom of the settings page is a Factory Reset Button (changes the settings to: userName: username,
darkMode: disabled, fontSize: normal), and the rest are just to send an alert to the phone telling what each respective setting
parameter is currently set to.  Opening up the app and opening the settings page also triggers the "getters" for the stored
info, which will be used later to make sure the app is in the correct state in which the user left it.