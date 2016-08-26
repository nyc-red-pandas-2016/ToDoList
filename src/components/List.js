import React, { Component } from 'react'
import ToDo from './ToDo.js'

export default class List extends Component {

  render() {

    var lists = this.props.lists;

    return (
        <div className = "ToDoList">
         <h3>To Do List:</h3>
          <ul>
              {lists.map((todo, id) => {
                return <ToDo key={id} todo={todo} />;
              })}
          </ul>
        </div>
    )
  }
}
