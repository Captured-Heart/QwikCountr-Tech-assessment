<div align="center">
  <img src="./assets/logo.png" style="margin: auto;display: block;width: 22.5%" />
  <br />
  <h1>QwikCountr Demo</h1>
  <strong>A Flutter app that displays stock market data and allows users to track their favorite stocks.</strong>
  <br />
  <sub>Built by <a href="https://twitter.com/CapturedWarrior">Captured-Heart</a></sub>
  <br />
</div>


## Tasks for the assessment

- ✅ Use the [marketstack API](marketstack.com), build an app that shows the stock market report of 10 random companies
- ⚠️ Add a date range and auto complete search box (Intentional left it out, until i am sure i am not being fooled)
- ✅ Notify the user if the device is offline
- ✅ Add a production-grade README.md file

# Features

- Real-time stock data for major stock exchanges
- Add stocks to a watchlist and track their performance(Gridview and ListView)
- Dark and light themes for a personalized look
- Offline support for viewing stock data when an internet connection is not available

## UI Shots

<div style="text-align: center">
  <table>
    <tr>
      <td style="text-align: center">
        <img src="./screenshots/dark01.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/dark02.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/dark03.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/dark04.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/dark05.png" width="200" />
      </td>
    </tr>
    <tr>
      <td style="text-align: center">
        <img src="./screenshots/light01.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/light02.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/light03.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/light04.png" width="200" />
      </td>
      <td style="text-align: center">
        <img src="./screenshots/light05.png" width="200" />
      </td>
    </tr> 
  </table>
</div>

## Tools

- [flex_color_scheme: by my friend SuperMike](https://pub.dev/packages/flex_color_scheme)[visit his website: RydMike](rydmike.com)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [internet_connection_checker: This was really helpful in checking for failed internet connection](https://pub.dev/packages/internet_connection_checker)
- [flutter_riverpod: A very great tool for managing states acroos any application by Remi Rousselette ](https://pub.dev/packages/flutter_riverpod)

For a full description of OSS used, see pubspec.yaml

# Credits

Stock data provided, and you can also generate your own Api keys and  [MarketstackAPI](https://marketstack.com/)
