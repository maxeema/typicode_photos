# typicode_photos

Flutter assignment by **XXX** company.<br/>

The app name is **Typicode Photos** because it consumes and renders photos from https://jsonplaceholder.typicode.com/photos <br/>
Built with Flutter applying SOLID and Clean Architecture.<br/>
Used packages: bloc, hive, retrofit, rxdart, flutter_hooks, connectivity_plus, freezed, dartz, and others.<br/>

**Here is the assignment**.<br/>

- Create an infinite scroll list with images (use https://jsonplaceholder.typicode.com/photos?_start=0&_limit=5 as API source).<br/>
- Each image in the list has a title, an image preview, and a like button.<br/>
- By tapping on a preview image user is shown a full-sized image in a popup.<br/>
- Users can like and unlike images by tapping the like button.<br/>
- Like state persists between app launches.<br/><br/>

<nobr><img src="screens/typicode_photos1.png" width="400"/><img src="screens/typicode_photos2.png" width="400"/></nobr><br/>

**App extra feature using connectivity_plus** <br/>
With [connectivity_plus](https://pub.dev/packages/connectivity_plus) the app tries to autoload the next chunk of photos
if we had an error and detected the network availability by the plugin help.

**The app supports states** <br/>
- when nothing been loaded, and we are trying to load showing progress
- when nothing been loaded, and we got some network with the message and retry button
- when we have some data loaded, and we are trying to load more automatically showing progress in the very end of the list view
- when we have some data loaded, and we got some network error with the message and retry button in the very end of the list view
- when we have data loaded and reached the end with showing an appropriate message in the very end of the list view

**TODO**
- test coverage <br/>
- show a detailed reason of network failures (when no network or a bad server response, etc.) <br/>
- add logging (tracing) of calls of working with services, repos, use-cases, bloc events, ... <br/>
- add GitHub workflows for auto testing, and code analyzing

*PS*: I tried to use [infinite_scroll_pagination v3.1.0](https://pub.dev/packages/infinite_scroll_pagination),
but unfortunately, it worked with issues and hasn't been supported/updated for more than 8 months (Mar 6, 2022).

----------------------

Best regards,<br/>
Max Shemetov<br/>

March, 2022
