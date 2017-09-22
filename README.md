# React Native Watch

[![Travis](https://img.shields.io/travis/alexisleon/react-native-watch.svg?maxAge=2592000)](https://travis-ci.org/alexisleon/react-native-watch)
[![npm version](https://img.shields.io/npm/v/react-native-watch.svg)](https://www.npmjs.com/package/react-native-watch)
[![npm dm](https://img.shields.io/npm/dm/react-native-watch.svg)](https://www.npmjs.com/package/react-native-watch)
[![npm dt](https://img.shields.io/npm/dt/react-native-watch.svg)](https://www.npmjs.com/package/react-native-watch)


***This is a beta release***

*Requirements:*

* `react-native >= 0.41.2` for iOS

Connect your React Native App with WatchKit.

***Android Wear support coming soon..***

## Getting started

```
yarn add react-native-watch
```

### Automatic installation

```
react-native link react-native-watch
```

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-watch` and add `RNWatch.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNWatch.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

## Usage

Use the examples below to start sending data between React Native and WatchOS (Swift)

**ES5**
```javascript
var watch = require('react-native-watch')
```

**ES6**
```javascript
import * as watch from 'react-native-watch'
```

### Messages

#### Receive messages

Subscribe and unsubscribe to all messages.

```javascript
// Subscribe
componentDidMount() {
  this.messageSubscription = watch.subscribeToMessages(
    (err, message, replyHandler) => {
      if (err) console.error('Error receiving message', err)
      else {
        if (replyHandler) replyHandler(...)
        ...
      }
    }
  )
}

// Unsubscribe
componentWillUnmount() {
  // messageSubscription -> remove function waiting to be called
  this.messageSubscription()
}
```

#### Send Message

Send messages and receive a response

```javascript
watch.sendMessage(data, (err, res) => {
  if (err) console.error('Error sending message to watch', err)
  else {
    console.log('Watch received the message sent')
    if (res) {
      console.log('Watch replied', res)
    }
  }
})
```

## Testing

```bash
yarn run test
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/alexisleon/react-native-watch/tags).

## Authors

* **Alexis Leon** - *Initial work* - [AlexisLeon](https://github.com/AlexisLeon)

See also the list of [contributors](https://github.com/alexisleon/react-native-watch/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Inspirited by [Conor Buckley](https://github.com/conorbuck/react-native-watch.git)
* Inspirited by [Michael Ford](https://github.com/mtford90/react-native-watch-connectivity)
