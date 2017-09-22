/**
 * @providesModule RNWatch
 * @flow
 */
import { NativeModules, NativeEventEmitter } from 'react-native'
const { RNWatch } = NativeModules
const WatchEventEmitter = new NativeEventEmitter(RNWatch);

const EVENT_RECEIVE_MESSAGE = 'WatchReceiveMessage'
let subscription;


// Messages

/**
 * Send a message to the watch over the bridge
 * @param {object} [message]
 * @param {sendMessageCallback} [cb]
 */
export function sendMessage (message = {}, cb = () => {}) {
  return RNWatch.sendMessage(message, reply => cb(null, reply), err => cb(err))
}

/**
 *
 * @param {fileTransferCallback} [cb]
 * @return {sendMessageCallback} unsubscribe
 */
export function subscribeToMessages (cb = () => {}) {
  return _subscribe(EVENT_RECEIVE_MESSAGE, payload => {
    console.log('received message payload', payload)
    const messageId    = payload.id
    const replyHandler = messageId ? resp => RNWatch.replyToMessageWithId(messageId, resp) : null
    cb(null, payload, replyHandler)
  })
}


// Helpers

/**
 * Add listener to event
 * @param {string} event
 * @param {function} [cb]
 * @return {function} unsubscribe
 * @private
 */
export function _subscribe (event, cb = () => {}) {
  if (!event) throw new Error('Missing required param: event.')
  subscription = WatchEventEmitter.addListener(event, cb);
  return subscription.remove
}
