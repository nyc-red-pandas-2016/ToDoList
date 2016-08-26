import React, { Component } from 'react'

export default class List extends Component {
  constructor() {
    super();
    this.state = {
      lists: [{item: "Buy flowers"}, {item: "Eat Spinach"}, {item: "Arrest the Fugitive"}, {item: "Smash the Dinner Plates"}, {item: "Move the Piano"}, {item: "Lurch Toward the Door"}, {item:"Anger the Constable"}]
    }
  }

  render() {
    return (
      <div>
      <h3>To Do List:</h3>
      <ul>
          <p>Test To Do Item</p>
          
      </ul>
      </div>
    )
  }
}
