import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
} from 'react-native';
import { Svg, Path } from 'react-native-svg';




function App(): React.JSX.Element {
  return (
    <SafeAreaView style={styles.background}>
      <Svg viewBox="0 0 24 24" width="200" height="200" fill="none">
      <Path
        d="M8 0a8 8 0 0 1 8 8v12l-4.919-1-3.08 1-2.992-1L0 20V8a8 8 0 0 1 8-8zm6 8A6 6 0 0 0 2 8v9.561l3.138-.626 2.871.96 2.955-.96 3.036.618V8zm-8.5 2a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" 
        fill="#e9ecef"
        transform={'translate(4 2)'}
      />
      </Svg>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  background: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#212529',
  },
});

export default App;
