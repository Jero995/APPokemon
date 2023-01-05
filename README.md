#APPokemon
![](https://i.postimg.cc/VNh9c35Y/appokemon.png)

## How to install and run this project

#####This project was built using Flutter version 3.3.10, and it should work with the latest version as well. Make sure you have this version or a newer one by running `flutter upgrade`

1. Run `git clone url` in your terminal to clone the project.
2. Open the cloned project and run `flutter pub get` to install its dependencies.
3. You can then run the project by running `flutter run` or by pressing F5.
	- If you encounter any errors, try running `flutter clean` and `flutter pub get` again.
	- If you get any errors when running the project on iOS, follow these steps:
		+ Delete the following three folders: '.symlinks', 'Pods', 'Podfile.lock'.
		+ In your terminal, run `cd ios`.
		+ Then run `pod install` and `pod update`.
		+ Finally, go back to the main folder by running `cd ..` and then run `flutter clean` and `flutter pub get` again.
		
		
## Project flow

1. **Splash screen** that is displayed until all the pokemons are loaded.
2. **Home page**, where you can find all the pokemons. You can see their name, number, image, and type. There is also a heart next to their name that you can tap to add them to your favorite pokemons, which you can view by tapping the large heart on the app bar.
3. **Details page**, where you can find more information about the pokemon you tapped on the home page, and a button to add or remove it from your favorites.
4. **Favorites page**, where you can see your list of favorite pokemons. You can tap on them to go to their details page.