/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/emin93/react-native-template-typescript
 *
 * @format
 */

import React, { Component } from "react";
import { StyleSheet, Text, NativeModules } from "react-native";

var RNHandshakeChat = NativeModules.RNHandshakeChat;

const styles = StyleSheet.create({
  welcome: {
    fontSize: 20,
    textAlign: "center",
    margin: 10
  }
});

interface Props {}

export default class Version extends Component<Props> {
  state = {
    version: "1"
  };

  constructor(props: any) {
    super(props);
    RNHandshakeChat.Version("")
      .then((result: string) => this.setState({ version: result }))
      .catch((err: any) => console.log(err));
  }

  render() {
    return <Text style={styles.welcome}>Version {this.state.version}</Text>;
  }
}
