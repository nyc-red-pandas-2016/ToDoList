import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import CreateForm from './components/CreateForm';
import List from './components/List';

class App extends Component {
  constructor() {
    super();
    this.state = {
      lists:[]
      };
  }

  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to The To Do List!</h2>
        </div>
        <div>
          <CreateForm/>
        </div>
        <div>
          <List/>
        </div>
      </div>
    );
  }
}

export default App;
