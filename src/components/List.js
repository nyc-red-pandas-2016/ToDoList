import React, { Component } from 'react'
import ToDo from './ToDo.js'

export default class List extends Component {
  constructor() {
    super();
    this.state = {
      lists: [{item: "Buy flowers"}, {item: "Clean the house"}, {item: "Do the laundry"}]
    }
  }

  render() {

    var lists = this.props.lists;

    return (
      <div>
      <h3>To Do List:</h3>
      <ul>
          <ToDo />
      </ul>
      </div>
    )
  }
}
