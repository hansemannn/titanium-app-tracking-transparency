# iOS 14.5+ App Tracking Transparency

use the AppTrackingTransparency framework (iOS 14.5+) in the Titanium SDK.

## Requirements

- [x] Titanium SDK 9.2.0+
- [x] iOS 14.5+
- [x] The `NSUserTrackingUsageDescription` permission flag in your tiapp.xml `<ios>` plist section

## API

### Properties

- [x] `authorizationStatus`, one of:
  - `AUTHORIZATION_STATUS_AUTHORIZED`
  - `AUTHORIZATION_STATUS_DENIED`
  - `AUTHORIZATION_STATUS_NOT_DETERMINED`
  - `AUTHORIZATION_STATUS_RESTRICTED`

### Methods

- [x] `hasTrackingPermissions() -> Bool`
- [x] `requestTrackingPermissions(callback)`

## Example

See example/app.js

## Author

Hans Knöchel

## License

MIT

## Copyright

(c) 2021-present by Hans Knöchel
